#include "edge_ai/ecs.hpp"
#include "edge_ai/core.hpp"
#include "edge_ai/live_session.hpp"
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
#include "tnm_native.h"
#endif

#include <algorithm>
#include <array>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <limits>
#include <new>
#include <random>
#include <stdexcept>
#include <string>

namespace {
bool count_allocations=false;
std::size_t allocation_count=0;
}
void* operator new(std::size_t size){
  if(count_allocations)++allocation_count;
  if(void* p=std::malloc(size?size:1))return p;
  throw std::bad_alloc();
}
void* operator new[](std::size_t size){return ::operator new(size);}
void operator delete(void* p)noexcept{std::free(p);}
void operator delete[](void* p)noexcept{std::free(p);}
void operator delete(void* p,std::size_t)noexcept{std::free(p);}
void operator delete[](void* p,std::size_t)noexcept{std::free(p);}

namespace {
using namespace edge_ai::ecs;
unsigned checks=0;
void require(bool condition,const char* message){++checks;if(!condition)throw std::runtime_error(message);}
template<class F>void rejects(F f,const char* message){bool threw=false;try{f();}catch(const std::exception&){threw=true;}require(threw,message);}
std::vector<std::uint8_t> bytes(const std::string& path){
  std::ifstream file(path,std::ios::binary);if(!file)throw std::runtime_error("Missing fixture: "+path);
  return {std::istreambuf_iterator<char>(file),{}};
}
Digest hash_text(const std::string& text){
  return sha256(std::span(reinterpret_cast<const std::uint8_t*>(text.data()),text.size()));
}
Event event(std::uint64_t tick,std::uint64_t sequence,Opcode op,std::uint64_t argument=0,
            EntityId target={0,1},std::uint32_t source=0,std::uint16_t component=0){
  return Event{tick,source,0,sequence,target,op,component,0,argument};
}
Kernel tiny(std::uint64_t initial=0){
  Kernel k(Config{4,16,64,4,{}});auto e=k.create_entity();k.set_component(e,0,initial);return k;
}
void test_hash(){
  require(hex_digest(hash_text(""))=="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","SHA256 empty KAT");
  require(hex_digest(hash_text("abc"))=="ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad","SHA256 abc KAT");
  require(hex_digest(hash_text("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"))==
    "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1","SHA256 padding KAT");
  require(hex_digest(hash_text(std::string(1000000,'a')))==
    "cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0","SHA256 multiblock KAT");
}
void test_pair_and_budget(){
  auto k=tiny(10);k.set_rule({0,1},Rule{2,0,1,0});
  require(k.enqueue(event(1,1,Opcode::PairActRewrite64,1))==Status::Ok,"Pair admission");
  const auto before=k.canonical_state();
  auto insufficient=k.commit_through(1,{},WorkBudget{0,100000});
  require(insufficient.status==Status::WorkBudgetExceeded&&k.canonical_state()==before,"Budget changed state or queue");
  insufficient=k.commit_through(1,{},WorkBudget{100,0});
  require(insufficient.status==Status::WorkBudgetExceeded&&k.canonical_state()==before,"Operation budget changed state");
  allocation_count=0;count_allocations=true;const auto commit=k.commit_through(1);count_allocations=false;
  require(allocation_count==0,"Commit allocated memory");
  require(commit.applied==1&&k.component({0,1},0)==13,"Act used wrong snapshot");
  require(k.rule({0,1}).act_addend==9&&k.rule({0,1}).version==2,"Rewrite did not use pre-event snapshot");
  require(k.enqueue(event(2,2,Opcode::PairActRewrite64,0))==Status::Ok,"Next-event admission");
  require(k.commit_through(2).applied==1&&k.component({0,1},0)==22,"Rewritten rule did not become active next event");
  require(k.rule({0,1}).act_addend==4,"Second rewrite snapshot");
  rejects([&]{k.set_component({0,1},0,100);},"Setup mutation after publication accepted");
  rejects([&]{k.set_rule({0,1},Rule{});},"Rule setup after publication accepted");
}
void test_order(){
  std::array<Event,5> events={event(2,2,Opcode::AddWrap64,2),event(1,1,Opcode::Set64,3),
    event(2,2,Opcode::Xor64,7,{0,1},1),event(3,3,Opcode::AddWrap64,9),event(1,1,Opcode::Xor64,1,{0,1},1)};
  std::array<unsigned,5> indices{0,1,2,3,4};Digest expected{};bool first=true;
  do{
    auto k=tiny();for(auto i:indices)require(k.enqueue(events[i])==Status::Ok,"Permuted input admission");
    const auto report=k.commit_through(3);require(report.applied==5,"Canonical replay unexpectedly rejected input");
    require(k.component({0,1},0)==12,"Lexicographic event order changed arithmetic result");
    if(first){expected=k.state_sha256();first=false;}else require(k.state_sha256()==expected,"Arrival order changed state or receipts");
  }while(std::next_permutation(indices.begin(),indices.end()));
  auto k=tiny();require(k.enqueue(event(1,2,Opcode::Set64,1))==Status::Ok,"Sequence test admission1");
  require(k.enqueue(event(2,1,Opcode::Set64,9))==Status::Ok,"Sequence test admission2");
  auto report=k.commit_through(2);require(report.applied==1&&report.by_status[static_cast<unsigned>(Status::ReplaySequence)]==1,"Out-of-order source sequence not rejected");
}
void test_admission(){
  auto k=tiny();auto e=event(1,1,Opcode::Set64,4);
  require(k.enqueue(e)==Status::Ok&&k.enqueue(e)==Status::Duplicate,"Identical duplicate contract");
  require(k.commit_through(1).applied==1,"Duplicate was executed twice");
  require(k.enqueue(e)==Status::LateEvent,"Published frontier accepted late event");
  auto future=e;future.logical_tick=2;
  require(k.enqueue(future)==Status::ReplaySequence,"Previously consumed sequence reused");
  future.sequence=2;future.source_epoch=1;
  require(k.enqueue(future)==Status::SourceEpochMismatch,"Unknown epoch accepted");
  require(k.rotate_source_epoch(0,1)==Status::Ok,"Explicit epoch barrier failed");
  future.sequence=0;
  require(k.enqueue(future)==Status::Ok,"New epoch sequence reset rejected");
  require(k.rotate_source_epoch(0,2)==Status::InvalidFrontier,"Epoch changed with pending events");
  require(k.commit_through(2).applied==1,"New epoch did not execute");
  require(k.commit_through(1).status==Status::InvalidFrontier,"Clock frontier regressed");
  auto invalid=event(3,1,static_cast<Opcode>(65535));invalid.source_epoch=1;
  require(k.enqueue(invalid)==Status::InvalidEvent,"Unknown opcode admitted");
  invalid.opcode=Opcode::Set64;invalid.flags=1;
  require(k.enqueue(invalid)==Status::InvalidEvent,"Unknown flags admitted");
  Kernel bounded(Config{1,1,1,1,{}});bounded.create_entity();
  require(bounded.enqueue(event(1,1,Opcode::Set64,1))==Status::Ok,"Bounded queue first");
  require(bounded.enqueue(event(2,2,Opcode::Set64,2))==Status::QueueFull&&bounded.queued()==1,"Queue bound ignored");
  Kernel empty;require(empty.commit_through(0).processed==0,"Empty commit");
  rejects([]{Kernel bad(Config{0,1,1,1,{}});},"Zero capacity accepted");
  rejects([]{Kernel bad(Config{1,65,1,1,{}});},"Component bitset overflow accepted");
}
void test_conflict(){
  auto a=tiny(),b=tiny();auto x=event(1,1,Opcode::Set64,4),y=x;y.argument=9;
  require(a.enqueue(x)==Status::Ok&&a.enqueue(y)==Status::ConflictingDuplicate,"Conflict admission1");
  require(b.enqueue(y)==Status::Ok&&b.enqueue(x)==Status::ConflictingDuplicate,"Conflict admission2");
  require(a.canonical_state()==b.canonical_state(),"Conflicting duplicate arrival changed pending representation");
  require(a.commit_through(1).rejected==1&&b.commit_through(1).rejected==1,"Conflicting identity was executed");
  require(a.state_sha256()==b.state_sha256()&&a.component({0,1},0)==0,"Conflicting duplicate changed result");
}
void test_lifecycle_and_overflow(){
  auto k=tiny(std::numeric_limits<std::uint64_t>::max());
  k.enqueue(event(1,1,Opcode::AddChecked64,1));
  auto r=k.commit_through(1);require(r.rejected==1&&k.component({0,1},0)==std::numeric_limits<std::uint64_t>::max(),"Checked overflow mutated state");
  k.enqueue(event(2,2,Opcode::AddWrap64,1));require(k.commit_through(2).applied==1&&k.component({0,1},0)==0,"Unsigned wrap contract");
  k.enqueue(event(3,3,Opcode::DestroyEntity));k.enqueue(event(4,4,Opcode::SpawnEntity,0,{0,2}));
  k.enqueue(event(5,5,Opcode::Set64,99,{0,1}));r=k.commit_through(5);
  require(r.applied==2&&r.by_status[static_cast<unsigned>(Status::StaleEntity)]==1,"Generation guard failed");
  require(!k.alive({0,1})&&k.alive({0,2})&&!k.has_component({0,2},0),"Entity reuse retained stale state");
  Kernel retired(Config{1,1,4,1,{}});retired.initialize_entity({0,0xffffffffU});
  retired.enqueue(event(1,1,Opcode::DestroyEntity,0,{0,0xffffffffU}));
  retired.enqueue(event(2,2,Opcode::SpawnEntity,0,{0,0xffffffffU}));r=retired.commit_through(2);
  require(r.applied==1&&r.rejected==1&&!retired.alive({0,0xffffffffU}),"Exhausted generation reused");
  auto pair=tiny(7);pair.set_rule({0,1},Rule{2,3,std::numeric_limits<std::uint64_t>::max(),0});
  pair.enqueue(event(1,1,Opcode::PairActRewrite64,9));r=pair.commit_through(1);
  require(r.rejected==1&&pair.component({0,1},0)==7&&pair.rule({0,1}).act_addend==2,"Failed paired transaction partially committed");
}
void test_permissions(){
  auto k=tiny(7);k.set_rule({0,1},Rule{2,0,1,0});
  k.enqueue(event(1,1,Opcode::PairActRewrite64,1));auto r=k.commit_through(1,Capabilities{Mutate});
  require(r.rejected==1&&k.component({0,1},0)==7&&k.rule({0,1}).version==1,"Rewrite capability bypass");
  k.enqueue(event(2,2,Opcode::Set64,100));r=k.commit_through(2,Capabilities{0});
  require(r.rejected==1&&k.component({0,1},0)==7,"Mutation capability bypass");
}
void test_lut(const std::string& directory){
  const auto lut=edge_ai::HexLut::load(directory+"/hex_q16_bitplanes.bin",directory+"/hex_validity_bits.bin");
  auto k=tiny();k.attach_lut(lut);
  k.enqueue(event(1,1,Opcode::D6Lookup,37));require(k.commit_through(1).applied==1,"LUT module failed");
  require(k.component({0,1},0)==lut.canonical_sample(0,37).q16,"LUT module changed source sample");
  unsigned bad_row=0,bad_angle=0;bool found=false;
  for(unsigned row=0;row<17&&!found;++row)for(unsigned angle=0;angle<72;++angle)if(!lut.at(row,angle).valid){bad_row=row;bad_angle=angle;found=true;break;}
  require(found,"No invalid source fixture sample");
  k.enqueue(event(2,2,Opcode::D6Lookup,(std::uint64_t(bad_row)<<32)|bad_angle));
  require(k.commit_through(2).applied==1&&!k.has_component({0,1},0),"Invalid sample became measured zero");
}
void test_tomagi(const std::string& path){
  const auto tmg=bytes(path);auto k=tiny();k.attach_tomagi(tmg);k.initialize_tomagi_entity({0,1});
  require(k.component({0,1},0)==19,"Original initial rho");
  k.enqueue(event(1,1,Opcode::TomagiStep));allocation_count=0;count_allocations=true;
  const auto r1=k.commit_through(1);count_allocations=false;
  require(allocation_count==0&&r1.applied==1&&r1.operations==146,"TOMAGI tick allocation/work contract");
  require(k.component({0,1},12)==291744817&&k.component({0,1},15)==16,"TOMAGI first source trace mismatch");
  k.enqueue(event(2,2,Opcode::TomagiStep));require(k.commit_through(2).applied==1,"TOMAGI second step failed");
  const std::array<std::uint32_t,16> expected={19,0,0,0,0,0,0,0,0,0,1,2,4102348696U,19,0,25};
  for(unsigned i=0;i<16;++i)require(k.component({0,1},i)==expected[i],"TOMAGI published source final state mismatch");
  auto bad=tmg;bad[40]=1;rejects([&]{auto p=tiny();p.attach_tomagi(bad);},"TOMAGI reserved words accepted");
  bad=tmg;bad.pop_back();rejects([&]{auto p=tiny();p.attach_tomagi(bad);},"Truncated TOMAGI accepted");
  bad=tmg;bad[128+8]=16;rejects([&]{auto p=tiny();p.attach_tomagi(bad);},"Unknown TOMAGI opcode accepted");
  bad=tmg;bad[128+32]=255;rejects([&]{auto p=tiny();p.attach_tomagi(bad);},"Invalid TOMAGI successor accepted");
  auto replay=tiny();replay.attach_tomagi(tmg);replay.initialize_tomagi_entity({0,1});
  replay.enqueue(event(2,2,Opcode::TomagiStep));replay.enqueue(event(1,1,Opcode::TomagiStep));replay.commit_through(2);
  require(replay.state_sha256()==k.state_sha256(),"Actual source model replay changed canonical state");
  auto entry=tmg;entry[20]=2;auto start=tiny();start.attach_tomagi(entry);start.initialize_tomagi_entity({0,1});
  require(start.component({0,1},11)==2,"Fresh model ignored original entry field");
}
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
void test_native_profiles(){
  // Independent original Node/WebAssembly full-memory goldens, second event,
  // native_modules/tests/golden.json at the pinned TNOMTOM revision.
  constexpr const char* golden[]={
    "1bdb605d477327050b237a7a0fe0b3d3baa478555393042ff427f416f9ee36b9",
    "8fa6e5068e9eaa2cf3753c3abac4e634c0e6ac91314f62b37edacc715aa4d232",
    "4612e0ee38f2e144a096a50bd03b1363f98e4e1fa50b90fc928afc2c943f47ee",
    "bc2ad0d000a93c93c546447968cd5fbe8b0106c7ca8b2822600702b24c95f82e",
    "bb886593fba43ca1451a9e202baedd34746715cfd4e221f23ab7feab27602a4a",
    "e529f331a501447f90be6708e664dd608490b7ed3697b085051f4ad096cafbcd",
    "b597df3c43b71180a015bcb29042894a874dbb3bd1745600e8034920f4fe7f4f",
    "937e4727b8f888b8b6d2c879c0abdac928465a357b1125a5265fe881e900e939"};
  require(tnm_profile_count()==8,"Pinned native profile count changed");
  auto make=[](bool reverse){
    Kernel k(Config{8,64,32,8,{}});
    for(unsigned i=0;i<8;++i)k.create_entity();
    for(unsigned j=0;j<8;++j){const unsigned i=reverse?7-j:j;k.attach_native_profile({i,1},tnm_profile(i)->id);}
    return k;
  };
  auto a=make(false),b=make(true);
  require(a.state_sha256()==b.state_sha256(),"Binding setup order changed canonical native authority");
  std::vector<Event> events;
  for(unsigned tick=1;tick<=2;++tick)for(unsigned i=0;i<8;++i)
    events.push_back(event(tick,tick,Opcode::NativeProfileStep,0,{i,1},i));
  for(const auto& e:events)require(a.enqueue(e)==Status::Ok,"Native event admission");
  std::mt19937 random(1234);std::shuffle(events.begin(),events.end(),random);
  for(const auto& e:events)require(b.enqueue(e)==Status::Ok,"Shuffled native event admission");
  const auto before=a.state_sha256();
  require(a.commit_through(2,{},WorkBudget{16,0}).status==Status::WorkBudgetExceeded,"Native budget preflight");
  require(a.state_sha256()==before,"Budget failure advanced native source state");
  allocation_count=0;count_allocations=true;const auto ar=a.commit_through(2);count_allocations=false;
  require(allocation_count==0,"Native ECS commit allocated C++ memory");
  const auto br=b.commit_through(2);
  require(ar.applied==16&&br.applied==16,"One of8native profiles failed its default2step contract");
  require(a.state_sha256()==b.state_sha256(),"Native event arrival order changed complete state");
  const auto states=a.native_profile_states();require(states.size()==8,"Native summary omitted profile");
  for(unsigned i=0;i<8;++i){
    require(states[i].profile_id==tnm_profile(i)->id,"Native profile identity mismatch");
    require(states[i].sequence==2&&states[i].last_status==TNM_OK,"Native source sequence/status mismatch");
    require(states[i].memory_sha256==golden[i],"Native ECS complete memory differs from original WebAssembly golden");
  }
  a.enqueue(event(3,3,Opcode::DestroyEntity,0,{0,1},0));
  auto rejected=a.commit_through(3);
  require(rejected.rejected==1&&a.alive({0,1}),"Bound native entity destroyed without explicit lifecycle protocol");
  require(a.native_profile_states()[0].memory_sha256==golden[0],"Denied destruction changed source memory");

  // Explicit8-byte source input: read the original admitted input record and
  // send precisely those bytes through the SoA LE word transport.
  const auto* pair=tnm_profile(2);std::array<char,512> error{};
  auto* original=tnm_create(pair->id,error.data(),error.size());require(original!=nullptr,"Native input oracle setup");
  std::vector<std::uint8_t> memory(pair->memory_bytes);
  require(tnm_read_memory(original,memory.data(),memory.size())==TNM_OK,"Native oracle memory read");
  std::array<std::uint8_t,8> input{};std::copy_n(memory.begin()+30008,8,input.begin());
  std::uint64_t input_word=0;for(unsigned i=0;i<8;++i)input_word|=std::uint64_t(input[i])<<(8*i);
  tnm_receipt receipt{};require(tnm_step(original,input.data(),input.size(),&receipt,error.data(),error.size())==TNM_OK,"Native oracle input step");
  std::array<char,65> expected{};tnm_memory_sha256(original,expected.data());tnm_destroy(original);
  auto transported=tiny();transported.set_component({0,1},0,input_word);transported.attach_native_profile({0,1},pair->id);
  transported.enqueue(event(1,1,Opcode::NativeProfileStep,8));
  require(transported.commit_through(1).applied==1,"Exact source input transport failed");
  require(transported.native_profile_states()[0].memory_sha256==expected.data(),"LE source input bytes changed ABI");

  auto physics=tiny();physics.attach_native_profile({0,1},tnm_profile(6)->id);
  const auto physical_before=physics.native_profile_states()[0];
  physics.enqueue(event(1,1,Opcode::NativeProfileStep,2064));
  rejected=physics.commit_through(1);const auto physical_after=physics.native_profile_states()[0];
  require(rejected.by_status[static_cast<unsigned>(Status::InvalidEvent)]==1,"Oversized source input accepted");
  require(physical_before.memory_sha256==physical_after.memory_sha256&&physical_after.sequence==0,"Oversized input changed native memory");

  auto invalid=tiny();for(unsigned i=0;i<5;++i)invalid.set_component({0,1},i,0);
  invalid.attach_native_profile({0,1},tnm_profile(3)->id);
  const auto original_state=invalid.native_profile_states()[0];
  invalid.enqueue(event(1,1,Opcode::NativeProfileStep,40));rejected=invalid.commit_through(1);
  const auto rejected_state=invalid.native_profile_states()[0];
  require(rejected.rejected==1&&rejected_state.last_status!=TNM_OK,"Invalid rational input was not rejected by original source");
  require(rejected_state.memory_sha256==original_state.memory_sha256&&rejected_state.sequence==0,"Source rejection failed complete-memory rollback");
}
void test_live_session(){
  LiveSession first,replay;
  require(first.epoch()==0&&replay.epoch()==0,"Live session did not start at explicit epoch zero");
  const auto a1=first.observe_json(2ULL*1024*1024*1024,9806650,true,0);
  const auto b1=replay.observe_json(2ULL*1024*1024*1024,9806650,true,0);
  require(a1==b1&&first.epoch()==1,"Live first-epoch replay differs");
  require(a1.find("\"processed\":12,\"applied\":12,\"rejected\":0")!=std::string::npos,"Live epoch did not execute telemetry plus eight profiles");
  const auto a2=first.observe_json(2ULL*1024*1024*1024-4096,-1234567,true,1);
  const auto b2=replay.observe_json(2ULL*1024*1024*1024-4096,-1234567,true,1);
  require(a2==b2&&first.epoch()==2,"Retained two-epoch live replay differs");
  require(a2!=a1,"Live state did not advance");
  require(a2.find("\"accel_micro_ms2\":\"-1234567\"")!=std::string::npos,"Signed typed observation was lost");
  require(a2.find("1bdb605d477327050b237a7a0fe0b3d3baa478555393042ff427f416f9ee36b9")!=std::string::npos,"Live TOMK model was reinitialized instead of advancing to original second-event state");
  const auto skipped=first.observe_json(2ULL*1024*1024*1024,0,false,3);
  const auto replay_skipped=replay.observe_json(2ULL*1024*1024*1024,0,false,3);
  require(skipped==replay_skipped&&first.epoch()==3,"Recorded thermal admission cannot be replayed");
  require(skipped.find("\"native_admitted\":false")!=std::string::npos&&
          skipped.find("\"processed\":4,\"applied\":4,\"rejected\":0")!=std::string::npos,"Thermal limit lost telemetry or executed native stages");
  require(skipped.find("1bdb605d477327050b237a7a0fe0b3d3baa478555393042ff427f416f9ee36b9")!=std::string::npos,"Thermal skip changed native memory");
}
#endif
}
int main(int argc,char** argv){
  try{
    test_hash();test_pair_and_budget();test_order();test_admission();test_conflict();
    test_lifecycle_and_overflow();test_permissions();
    test_lut(argc>1?argv[1]:"assets/lognet");
    test_tomagi(argc>2?argv[2]:"ecs/vendor/tomk/examples/exact19_rule.tmg");
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
    test_native_profiles();
    test_live_session();
#endif
    require(run_fixture_json(1).find("\"equal\":true")!=std::string::npos,"Fixture wrapper replay mismatch");
    std::cout<<"PASS: "<<checks<<" ECS checks\n";
    std::cout<<run_fixture_json(1)<<'\n';
  }catch(const std::exception& error){count_allocations=false;std::cerr<<"FAIL after "<<checks<<": "<<error.what()<<'\n';return 1;}
}
