#include "edge_ai/ecs.hpp"
#include "edge_ai/core.hpp"
#include "vendor/tomk/tomagi.h"
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
#include "tnm_native.h"
#endif

#include <algorithm>
#include <array>
#include <bit>
#include <cstring>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <tuple>
#include <utility>

namespace edge_ai::ecs {
namespace {
constexpr std::uint64_t kKnownCapabilities = AllLocal;
void put(std::vector<std::uint8_t>& out,std::uint64_t value,unsigned width) {
  for(unsigned i=0;i<width;++i)out.push_back(static_cast<std::uint8_t>(value>>(8*i)));
}
std::uint32_t le32(std::span<const std::uint8_t> bytes,std::size_t at) {
  if(at>bytes.size() || bytes.size()-at<4)throw std::invalid_argument("Truncated TOMAGI word");
  return std::uint32_t(bytes[at])|(std::uint32_t(bytes[at+1])<<8)|
      (std::uint32_t(bytes[at+2])<<16)|(std::uint32_t(bytes[at+3])<<24);
}
std::int32_t signed32(std::uint32_t x) {
  return x<=0x7fffffffU?static_cast<std::int32_t>(x):
      -1-static_cast<std::int32_t>(0xffffffffU-x);
}
auto order(const Event& e){return std::tie(e.logical_tick,e.source_id,e.sequence);}
auto all_fields(const Event& e){
  return std::tuple(e.logical_tick,e.source_id,e.sequence,e.source_epoch,
    e.target.slot,e.target.generation,static_cast<std::uint16_t>(e.opcode),
    e.component,e.flags,e.argument);
}
template<std::size_t N>void fixed_put(std::array<std::uint8_t,N>& out,std::size_t& at,
    std::uint64_t value,unsigned width) {
  for(unsigned i=0;i<width;++i)out[at++]=static_cast<std::uint8_t>(value>>(8*i));
}
std::array<std::uint8_t,48> event_bytes(const Event& e) {
  std::array<std::uint8_t,48> out{};std::size_t at=0;
  fixed_put(out,at,e.logical_tick,8);fixed_put(out,at,e.source_id,4);
  fixed_put(out,at,e.source_epoch,4);fixed_put(out,at,e.sequence,8);
  fixed_put(out,at,e.target.slot,4);fixed_put(out,at,e.target.generation,4);
  fixed_put(out,at,static_cast<std::uint16_t>(e.opcode),2);fixed_put(out,at,e.component,2);
  fixed_put(out,at,e.flags,4);fixed_put(out,at,e.argument,8);return out;
}
bool known(Opcode op) {
  switch(op){case Opcode::Set64:case Opcode::AddWrap64:case Opcode::AddChecked64:
  case Opcode::Xor64:case Opcode::Copy64:case Opcode::PairActRewrite64:
  case Opcode::DestroyEntity:case Opcode::SpawnEntity:case Opcode::D6Lookup:
  case Opcode::TomagiStep:case Opcode::NativeProfileStep:return true;}return false;
}
std::uint64_t required(Opcode op) {
  switch(op){
  case Opcode::PairActRewrite64:return Mutate|Rewrite;
  case Opcode::DestroyEntity:case Opcode::SpawnEntity:return Lifecycle;
  case Opcode::D6Lookup:return Mutate|Lookup;
  case Opcode::TomagiStep:case Opcode::NativeProfileStep:return Mutate|NativeModel;
  default:return Mutate;
  }
}
std::array<std::uint32_t,16> state_words(const TomagiState& s) {
  return {static_cast<std::uint32_t>(s.rho),static_cast<std::uint32_t>(s.theta),
    static_cast<std::uint32_t>(s.tick),static_cast<std::uint32_t>(s.phi),
    static_cast<std::uint32_t>(s.vrho),static_cast<std::uint32_t>(s.vtheta),
    static_cast<std::uint32_t>(s.vtick),static_cast<std::uint32_t>(s.vphi),
    s.orientation,s.sheet,s.branch,s.cell,s.lineage,s.output,
    static_cast<std::uint32_t>(s.residual),s.status};
}
TomagiState words_state(const std::array<std::uint64_t,64>& v) {
  TomagiState s{};
  s.rho=signed32(v[0]);s.theta=signed32(v[1]);s.tick=signed32(v[2]);s.phi=signed32(v[3]);
  s.vrho=signed32(v[4]);s.vtheta=signed32(v[5]);s.vtick=signed32(v[6]);s.vphi=signed32(v[7]);
  s.orientation=v[8];s.sheet=v[9];s.branch=v[10];s.cell=v[11];s.lineage=v[12];s.output=v[13];
  s.residual=signed32(v[14]);s.status=v[15];return s;
}
}

const char* status_name(Status status) {
  constexpr const char* names[]={"ok","duplicate","conflicting_duplicate","late_event",
    "source_epoch_mismatch","invalid_event","queue_full","stale_entity","missing_component",
    "overflow","capability_denied","work_budget_exceeded","module_unavailable","replay_sequence",
    "invalid_frontier","setup_closed","entity_capacity","module_failure"};
  const auto i=static_cast<unsigned>(status);return i<18?names[i]:"invalid_status";
}

struct Kernel::Impl {
  struct Source{std::uint32_t epoch=0;std::uint64_t last_sequence=0;bool has_sequence=false;};
  struct Pending{Event event;bool conflict=false;};
  Config config;
  std::vector<std::uint64_t> values; // component-major structure of arrays.
  std::vector<std::uint64_t> presence;
  std::vector<std::uint32_t> generations;
  std::vector<std::uint8_t> living,retired;
  std::vector<Rule> rules;
  std::vector<Source> sources;
  std::vector<Pending> pending;
  std::array<LutSample,17*72> lut{};
  bool has_lut=false;
  Digest lut_digest{},tomagi_digest{},receipts{};
  TomagiProgram tomagi{};
  std::vector<TomagiCell> cells;
  std::vector<std::int8_t> native_index;
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
  struct NativeBinding {
    EntityId entity;
    tnm_instance* instance=nullptr;
    const tnm_profile_info* info=nullptr;
    std::int32_t status=TNM_OK;
    tnm_receipt receipt{};
  };
  std::array<NativeBinding,8> native{};
  std::uint32_t native_count=0;
  std::uint64_t native_bytes=0;
#endif
  bool started=false,frontier_set=false;
  std::uint64_t watermark=0,event_count=0,applied_count=0,rejected_count=0;

  explicit Impl(Config c):config(c) {
    if(!c.entity_capacity||c.entity_capacity>4096||!c.component_count||c.component_count>64||
       !c.event_capacity||c.event_capacity>65536||!c.source_capacity||c.source_capacity>1024)
      throw std::invalid_argument("TOM-ECS/1 capacities outside declared bounds");
    values.resize(std::size_t(c.entity_capacity)*c.component_count);
    presence.resize(c.entity_capacity);generations.resize(c.entity_capacity,1);
    living.resize(c.entity_capacity);retired.resize(c.entity_capacity);rules.resize(c.entity_capacity);
    native_index.resize(c.entity_capacity,-1);
    sources.resize(c.source_capacity);pending.reserve(c.event_capacity);
  }
  ~Impl(){
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
    for(std::uint32_t i=0;i<native_count;++i)tnm_destroy(native[i].instance);
#endif
  }
  void setup()const {if(started||!pending.empty())throw std::logic_error("Initial setup is closed after enqueue or commit");}
  bool alive(EntityId e)const{return e.slot<config.entity_capacity&&living[e.slot]&&generations[e.slot]==e.generation;}
  std::size_t at(std::uint32_t slot,std::uint16_t component)const{
    return std::size_t(component)*config.entity_capacity+slot;
  }
  void require_entity(EntityId e)const{if(!alive(e))throw std::invalid_argument("Stale or unknown entity");}
  void clear_entity(std::uint32_t slot){
    presence[slot]=0;rules[slot]=Rule{};
    for(std::uint32_t c=0;c<config.component_count;++c)values[at(slot,c)]=0;
  }
  std::uint64_t work(const Event& e)const{
    std::uint64_t n=2*config.component_count+16;
    if(e.opcode==Opcode::TomagiStep)n+=96+std::bit_width(tomagi.cell_count);
    else if(e.opcode==Opcode::D6Lookup)n+=12;
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
    else if(e.opcode==Opcode::NativeProfileStep&&native_index[e.target.slot]>=0)
      n+=128+native[static_cast<unsigned>(native_index[e.target.slot])].info->memory_bytes/64;
#endif
    return n;
  }
  Status apply(const Event& e,Capabilities caps) {
    if((caps.allowed&required(e.opcode))!=required(e.opcode))return Status::CapabilityDenied;
    if(e.opcode==Opcode::SpawnEntity){
      if(e.target.slot>=config.entity_capacity||living[e.target.slot]||retired[e.target.slot]||
         generations[e.target.slot]!=e.target.generation)return Status::StaleEntity;
      if(e.component||e.argument)return Status::InvalidEvent;
      clear_entity(e.target.slot);living[e.target.slot]=1;return Status::Ok;
    }
    if(!alive(e.target))return Status::StaleEntity;
    const auto slot=e.target.slot;
    if(e.opcode==Opcode::DestroyEntity){
      if(e.component||e.argument)return Status::InvalidEvent;
      if(native_index[slot]>=0)return Status::ModuleFailure;
      clear_entity(slot);living[slot]=0;
      if(generations[slot]==std::numeric_limits<std::uint32_t>::max())retired[slot]=1;
      else ++generations[slot];
      return Status::Ok;
    }
    // Only local target state is readable by these admitted systems. Both the
    // Act and Rewrite calculations consume these immutable pre-event values.
    std::array<std::uint64_t,64> before{},next{};
    for(std::uint32_t c=0;c<config.component_count;++c)before[c]=values[at(slot,c)];
    next=before;
    const auto old_presence=presence[slot];auto new_presence=old_presence;
    const Rule old_rule=rules[slot];Rule new_rule=old_rule;
    const auto bit=std::uint64_t{1}<<e.component;
    if(e.opcode!=Opcode::Set64&&e.opcode!=Opcode::Copy64&&e.opcode!=Opcode::D6Lookup&&
       e.opcode!=Opcode::TomagiStep&&e.opcode!=Opcode::NativeProfileStep&&
       !(old_presence&bit))return Status::MissingComponent;
    switch(e.opcode){
      case Opcode::Set64:next[e.component]=e.argument;new_presence|=bit;break;
      case Opcode::AddWrap64:next[e.component]=before[e.component]+e.argument;break;
      case Opcode::AddChecked64:
        if(e.argument>std::numeric_limits<std::uint64_t>::max()-before[e.component])return Status::Overflow;
        next[e.component]=before[e.component]+e.argument;break;
      case Opcode::Xor64:next[e.component]=before[e.component]^e.argument;break;
      case Opcode::Copy64:
        if(e.argument>=config.component_count)return Status::InvalidEvent;
        if(!(old_presence&(std::uint64_t{1}<<e.argument)))return Status::MissingComponent;
        next[e.component]=before[e.argument];new_presence|=bit;break;
      case Opcode::PairActRewrite64:
        if(old_rule.version==std::numeric_limits<std::uint64_t>::max())return Status::Overflow;
        next[e.component]=before[e.component]+old_rule.act_addend+e.argument;
        new_rule.act_addend=old_rule.act_addend^before[e.component]^e.argument^old_rule.rewrite_xor;
        new_rule.version=old_rule.version+1;break;
      case Opcode::D6Lookup:{
        if(!has_lut)return Status::ModuleUnavailable;
        const auto row=e.argument>>32;
        const auto angle=e.argument&0xffffffffULL;
        if(row>=17||angle>=72)return Status::InvalidEvent;
        const auto sample=lut[row*72+canonical_angle72(angle)];
        next[e.component]=sample.q16;
        if(sample.valid)new_presence|=bit;else new_presence&=~bit;
        break;
      }
      case Opcode::TomagiStep:{
        if(cells.empty())return Status::ModuleUnavailable;
        if(e.component||e.argument||config.component_count<16)return Status::InvalidEvent;
        if((old_presence&0xffffU)!=0xffffU)return Status::MissingComponent;
        for(unsigned i=0;i<16;++i)if(before[i]>0xffffffffULL)return Status::InvalidEvent;
        auto state=words_state(before);
        if(!tomagi_step(&tomagi,&state))return Status::ModuleFailure;
        const auto words=state_words(state);
        for(unsigned i=0;i<16;++i)next[i]=words[i];
        new_presence|=0xffffU;break;
      }
      case Opcode::NativeProfileStep:{
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
        if(native_index[slot]<0)return Status::ModuleUnavailable;
        auto& binding=native[static_cast<unsigned>(native_index[slot])];
        std::array<std::uint8_t,512> input{};
        if(e.argument==0){if(e.component)return Status::InvalidEvent;}
        else {
          if(e.argument!=binding.info->input_bytes||e.argument>input.size())return Status::InvalidEvent;
          const auto words=(e.argument+7)/8;
          if(words>config.component_count-e.component)return Status::InvalidEvent;
          for(std::uint64_t i=0;i<words;++i)
            if(!(old_presence&(std::uint64_t{1}<<(e.component+i))))return Status::MissingComponent;
          for(std::uint64_t i=0;i<e.argument;++i)
            input[i]=static_cast<std::uint8_t>(before[e.component+i/8]>>(8*(i%8)));
        }
        std::array<char,512> error{};
        tnm_receipt receipt{};
        const int status=tnm_step(binding.instance,e.argument?input.data():nullptr,
            static_cast<std::size_t>(e.argument),&receipt,error.data(),error.size());
        binding.status=status;binding.receipt=receipt;
        if(status!=TNM_OK)return Status::ModuleFailure;
        break;
#else
        return Status::ModuleUnavailable;
#endif
      }
      default:return Status::InvalidEvent;
    }
    // Commit state and description together after complete validation. No
    // callback, allocation, model I/O or externally visible publication occurs
    // between the paired assignments in this single-owner kernel.
    for(std::uint32_t c=0;c<config.component_count;++c)values[at(slot,c)]=next[c];
    presence[slot]=new_presence;rules[slot]=new_rule;return Status::Ok;
  }
  void receipt(const Event& e,Status status){
    std::array<std::uint8_t,84> bytes{};
    std::copy(receipts.begin(),receipts.end(),bytes.begin());
    const auto event=event_bytes(e);std::copy(event.begin(),event.end(),bytes.begin()+32);
    std::size_t pos=80;fixed_put(bytes,pos,static_cast<std::uint16_t>(status),2);
    fixed_put(bytes,pos,0,2);receipts=sha256(bytes);
  }
};

Kernel::Kernel(Config c):impl_(std::make_unique<Impl>(c)){}
Kernel::~Kernel()=default;
Kernel::Kernel(Kernel&&)noexcept=default;
Kernel& Kernel::operator=(Kernel&&)noexcept=default;
const Config& Kernel::config()const{return impl_->config;}
EntityId Kernel::create_entity(){
  impl_->setup();
  for(std::uint32_t i=0;i<impl_->config.entity_capacity;++i)if(!impl_->living[i]&&!impl_->retired[i]){
    EntityId e{i,impl_->generations[i]};initialize_entity(e);return e;}
  throw std::length_error("Entity capacity exhausted");
}
void Kernel::initialize_entity(EntityId e){
  impl_->setup();
  if(e.slot>=impl_->config.entity_capacity||!e.generation||impl_->living[e.slot]||impl_->retired[e.slot])
    throw std::invalid_argument("Invalid initial entity handle");
  impl_->generations[e.slot]=e.generation;impl_->clear_entity(e.slot);impl_->living[e.slot]=1;
}
void Kernel::set_component(EntityId e,std::uint16_t c,std::uint64_t value){
  impl_->setup();impl_->require_entity(e);
  if(c>=impl_->config.component_count)throw std::out_of_range("Component index");
  impl_->values[impl_->at(e.slot,c)]=value;impl_->presence[e.slot]|=std::uint64_t{1}<<c;
}
void Kernel::set_rule(EntityId e,Rule r){
  impl_->setup();impl_->require_entity(e);
  if(!r.version||r.reserved)throw std::invalid_argument("Invalid rule version/reserved word");
  impl_->rules[e.slot]=r;
}
void Kernel::set_source_epoch(std::uint32_t source,std::uint32_t epoch){
  impl_->setup();if(source>=impl_->sources.size())throw std::out_of_range("Source index");
  impl_->sources[source].epoch=epoch;
}
void Kernel::attach_lut(const edge_ai::HexLut& source){
  impl_->setup();if(!source.invariant())throw std::invalid_argument("LUT lacks verified D6 invariance");
  std::vector<std::uint8_t> bytes;bytes.reserve(17*72*3);
  for(unsigned r=0;r<17;++r)for(unsigned a=0;a<72;++a){
    auto s=source.at(r,a);impl_->lut[r*72+a]=s;put(bytes,s.q16,2);put(bytes,s.valid?1:0,1);}
  impl_->lut_digest=sha256(bytes);impl_->has_lut=true;
}
void Kernel::attach_tomagi(std::span<const std::uint8_t> bytes){
  impl_->setup();
  constexpr std::array<std::uint8_t,8> magic{'T','O','M','A','G','I','1',0};
  if(bytes.size()<128||bytes.size()>64ULL*1024*1024||
      !std::equal(magic.begin(),magic.end(),bytes.begin()))throw std::invalid_argument("Invalid bounded TOMAGI blob");
  auto count=le32(bytes,16);
  if(le32(bytes,8)!=0x00010000U||le32(bytes,32)!=48||le32(bytes,36)!=64||
      !count||count>1048576||bytes.size()!=128ULL+48ULL*count||le32(bytes,20)>=count)
    throw std::invalid_argument("TOMAGI header/size/capacity mismatch");
  for(unsigned i=0;i<6;++i)if(le32(bytes,40+4*i))throw std::invalid_argument("TOMAGI reserved header word");
  std::vector<TomagiCell> cells(count);
  for(std::uint32_t i=0;i<count;++i){
    const auto at=128+std::size_t(i)*48;auto& c=cells[i];
    c.key_hi=le32(bytes,at);c.key_lo=le32(bytes,at+4);c.opcode=le32(bytes,at+8);c.flags=le32(bytes,at+12);
    c.arg0=signed32(le32(bytes,at+16));c.arg1=signed32(le32(bytes,at+20));
    c.arg2=signed32(le32(bytes,at+24));c.arg3=signed32(le32(bytes,at+28));
    c.next0=le32(bytes,at+32);c.next1=le32(bytes,at+36);c.payload=le32(bytes,at+40);c.aux=le32(bytes,at+44);
    if(c.opcode>15||c.next0>=count||c.next1>=count||
        (i&&std::tie(cells[i-1].key_hi,cells[i-1].key_lo)>=std::tie(c.key_hi,c.key_lo)))
      throw std::invalid_argument("TOMAGI opcode, successor or sorted-key contract");
  }
  std::array<std::uint64_t,64> initial{};
  for(unsigned i=0;i<16;++i)initial[i]=le32(bytes,64+4*i);
  TomagiProgram program{};program.flags=le32(bytes,12);program.cell_count=count;
  program.entry=le32(bytes,20);program.seed=le32(bytes,24);program.default_ticks=le32(bytes,28);
  program.initial_state=words_state(initial);
  impl_->cells=std::move(cells);program.cells=impl_->cells.data();impl_->tomagi=program;
  impl_->tomagi_digest=sha256(bytes);
}
void Kernel::initialize_tomagi_entity(EntityId e){
  impl_->setup();impl_->require_entity(e);
  if(impl_->cells.empty()||impl_->config.component_count<16)throw std::logic_error("TOMAGI module or16components unavailable");
  auto words=state_words(impl_->tomagi.initial_state);
  // Match original Python run(program, state=None): a fresh program starts at
  // the header entry, whereas a restored explicit state retains its own cell.
  words[11]=impl_->tomagi.entry;
  for(unsigned i=0;i<16;++i)set_component(e,i,words[i]);
}
void Kernel::attach_native_profile(EntityId e,const std::string& profile_id){
  impl_->setup();impl_->require_entity(e);
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
  if(profile_id.empty()||profile_id.size()>256||impl_->native_index[e.slot]>=0)
    throw std::invalid_argument("Invalid or duplicate native profile binding");
  const auto* info=tnm_find_profile(profile_id.c_str());
  if(!info)throw std::invalid_argument("Unknown compiled native profile");
  if(impl_->native_count>=8||info->memory_bytes>8ULL*1024*1024-impl_->native_bytes)
    throw std::length_error("Native profile count or memory budget exceeded");
  std::array<char,512> error{};auto* instance=tnm_create(profile_id.c_str(),error.data(),error.size());
  if(!instance)throw std::runtime_error(std::string("Native profile initialization failed: ")+error.data());
  auto& binding=impl_->native[impl_->native_count];binding.entity=e;binding.instance=instance;binding.info=info;
  impl_->native_index[e.slot]=static_cast<std::int8_t>(impl_->native_count++);
  impl_->native_bytes+=info->memory_bytes;
#else
  (void)profile_id;
  throw std::runtime_error("Pinned native profiles were not included in this build");
#endif
}
std::vector<NativeProfileState> Kernel::native_profile_states()const{
  std::vector<NativeProfileState> result;
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
  result.reserve(impl_->native_count);
  for(std::uint32_t i=0;i<impl_->native_count;++i){
    const auto& binding=impl_->native[i];std::array<char,65> digest{};
    if(tnm_memory_sha256(binding.instance,digest.data())!=TNM_OK)
      throw std::runtime_error("Native memory digest unavailable");
    result.push_back({binding.entity,binding.info->id,digest.data(),tnm_sequence(binding.instance),
        binding.status,binding.receipt.trap_code});
  }
#endif
  return result;
}
Status Kernel::enqueue(const Event& e){
  auto& p=*impl_;
  if(!known(e.opcode)||e.flags||e.source_id>=p.sources.size()||
      e.target.slot>=p.config.entity_capacity||!e.target.generation||e.component>=p.config.component_count)
    return Status::InvalidEvent;
  if(e.source_epoch!=p.sources[e.source_id].epoch)return Status::SourceEpochMismatch;
  if(p.frontier_set&&e.logical_tick<=p.watermark)return Status::LateEvent;
  const auto& source=p.sources[e.source_id];
  if(source.has_sequence&&e.sequence<=source.last_sequence)return Status::ReplaySequence;
  for(auto& old:p.pending)if(old.event.source_id==e.source_id&&old.event.source_epoch==e.source_epoch&&old.event.sequence==e.sequence){
    if(old.event==e&&!old.conflict)return Status::Duplicate;
    old.conflict=true;
    // A conflicting duplicate rejects the whole identity. Keep a canonical
    // representative so its rejection receipt is independent of arrival order.
    if(all_fields(e)<all_fields(old.event))old.event=e;
    return Status::ConflictingDuplicate;
  }
  if(p.pending.size()>=p.config.event_capacity)return Status::QueueFull;
  p.pending.push_back({e,false});p.started=true;return Status::Ok;
}
CommitReport Kernel::commit_through(std::uint64_t tick,Capabilities caps,WorkBudget budget){
  auto& p=*impl_;CommitReport report;
  if((p.frontier_set&&tick<p.watermark)||(caps.allowed&~kKnownCapabilities)){
    report.status=Status::InvalidFrontier;return report;}
  std::uint64_t count=0,work=0;
  for(const auto& pending:p.pending)if(pending.event.logical_tick<=tick){
    ++count;const auto n=p.work(pending.event);
    if(work>std::numeric_limits<std::uint64_t>::max()-n){report.status=Status::WorkBudgetExceeded;return report;}
    work+=n;
  }
  if(count>budget.max_events||work>budget.max_operations||
      count>std::numeric_limits<std::uint64_t>::max()-p.event_count){
    report.status=Status::WorkBudgetExceeded;return report;}
  // std::sort requires no heap allocation. Admission never observes arrival
  // order once the caller publishes an explicit completeness frontier.
  std::sort(p.pending.begin(),p.pending.end(),[](const Impl::Pending& a,const Impl::Pending& b){return order(a.event)<order(b.event);});
  std::size_t consumed=0;
  for(const auto& pending:p.pending){
    const auto& e=pending.event;if(e.logical_tick>tick)break;
    auto& source=p.sources[e.source_id];Status status;
    if(pending.conflict)status=Status::ConflictingDuplicate;
    else if(source.has_sequence&&e.sequence<=source.last_sequence)status=Status::ReplaySequence;
    else status=p.apply(e,caps);
    if(!source.has_sequence||e.sequence>source.last_sequence){source.last_sequence=e.sequence;source.has_sequence=true;}
    p.receipt(e,status);++report.processed;++report.by_status[static_cast<unsigned>(status)];
    if(status==Status::Ok)++report.applied;else ++report.rejected;
    ++consumed;
  }
  p.pending.erase(p.pending.begin(),p.pending.begin()+static_cast<std::ptrdiff_t>(consumed));
  report.operations=work;p.event_count+=report.processed;p.applied_count+=report.applied;p.rejected_count+=report.rejected;
  p.started=true;p.frontier_set=true;p.watermark=tick;return report;
}
Status Kernel::rotate_source_epoch(std::uint32_t source,std::uint32_t next){
  auto& p=*impl_;
  if(!p.frontier_set||!p.pending.empty()||source>=p.sources.size())return Status::InvalidFrontier;
  auto& s=p.sources[source];
  if(s.epoch==std::numeric_limits<std::uint32_t>::max()||next!=s.epoch+1)return Status::SourceEpochMismatch;
  s={next,0,false};
  std::array<std::uint8_t,48> bytes{};std::copy(p.receipts.begin(),p.receipts.end(),bytes.begin());
  std::size_t at=32;fixed_put(bytes,at,0x48435045U,4);fixed_put(bytes,at,source,4);
  fixed_put(bytes,at,next,4);fixed_put(bytes,at,0,4);p.receipts=sha256(bytes);return Status::Ok;
}
bool Kernel::alive(EntityId e)const{return impl_->alive(e);}
std::optional<EntityId> Kernel::current_entity(std::uint32_t slot)const{
  if(slot>=impl_->config.entity_capacity||!impl_->living[slot])return std::nullopt;
  return EntityId{slot,impl_->generations[slot]};
}
bool Kernel::has_component(EntityId e,std::uint16_t c)const{
  return alive(e)&&c<impl_->config.component_count&&(impl_->presence[e.slot]&(std::uint64_t{1}<<c));
}
std::uint64_t Kernel::component(EntityId e,std::uint16_t c)const{
  if(!has_component(e,c))throw std::out_of_range("Missing component or stale entity");
  return impl_->values[impl_->at(e.slot,c)];
}
Rule Kernel::rule(EntityId e)const{impl_->require_entity(e);return impl_->rules[e.slot];}
std::size_t Kernel::queued()const{return impl_->pending.size();}
bool Kernel::has_frontier()const{return impl_->frontier_set;}
std::uint64_t Kernel::frontier()const{return impl_->watermark;}
std::vector<std::uint8_t> Kernel::canonical_state()const{
  const auto& p=*impl_;std::vector<std::uint8_t> out;
  out.reserve(256+p.values.size()*8+p.generations.size()*48+p.pending.size()*49+p.sources.size()*16);
  for(auto c:std::array<std::uint8_t,8>{'T','O','M','E','C','S','S',1})out.push_back(c);
  put(out,p.config.entity_capacity,4);put(out,p.config.component_count,4);
  put(out,p.config.event_capacity,4);put(out,p.config.source_capacity,4);
  out.insert(out.end(),p.config.contract_digest.begin(),p.config.contract_digest.end());
  out.insert(out.end(),p.lut_digest.begin(),p.lut_digest.end());out.insert(out.end(),p.tomagi_digest.begin(),p.tomagi_digest.end());
  out.insert(out.end(),p.receipts.begin(),p.receipts.end());
  put(out,p.started,1);put(out,p.frontier_set,1);put(out,p.has_lut,1);put(out,!p.cells.empty(),1);
  put(out,p.watermark,8);put(out,p.event_count,8);put(out,p.applied_count,8);put(out,p.rejected_count,8);
  for(const auto& source:p.sources){put(out,source.epoch,4);put(out,source.has_sequence,1);put(out,source.last_sequence,8);}
  for(std::uint32_t i=0;i<p.config.entity_capacity;++i){
    put(out,p.generations[i],4);put(out,p.living[i],1);put(out,p.retired[i],1);put(out,p.presence[i],8);
    const auto r=p.rules[i];put(out,r.act_addend,8);put(out,r.rewrite_xor,8);put(out,r.version,8);put(out,r.reserved,8);
  }
  for(auto value:p.values)put(out,value,8);
#ifdef EDGE_AI_HAVE_NATIVE_MODULES
  put(out,p.native_count,4);
  auto string=[&out](const char* value){const auto n=std::strlen(value);put(out,n,4);
    out.insert(out.end(),value,value+n);};
  // Binding setup order is not authority: serialize by stable entity slot.
  for(std::uint32_t slot=0;slot<p.config.entity_capacity;++slot)if(p.native_index[slot]>=0){
    const auto& b=p.native[static_cast<unsigned>(p.native_index[slot])];
    put(out,b.entity.slot,4);put(out,b.entity.generation,4);
    string(b.info->id);string(b.info->source_revision);string(b.info->wasm_sha256);
    string(b.info->recipe_sha256);string(b.info->bootstrap_sha256);
    put(out,tnm_sequence(b.instance),8);put(out,static_cast<std::uint32_t>(b.status),4);
    put(out,b.receipt.trap_code,4);put(out,b.receipt.call_count,4);
    for(unsigned j=0;j<TNM_MAX_CALLS;++j)put(out,static_cast<std::uint64_t>(b.receipt.call_status[j]),8);
    put(out,b.info->memory_bytes,4);const auto at=out.size();out.resize(at+b.info->memory_bytes);
    if(tnm_read_memory(b.instance,out.data()+at,b.info->memory_bytes)!=TNM_OK)
      throw std::runtime_error("Cannot serialize complete native authority");
  }
#else
  put(out,0,4);
#endif
  auto pending=p.pending;std::sort(pending.begin(),pending.end(),[](const Impl::Pending&a,const Impl::Pending&b){return order(a.event)<order(b.event);});
  put(out,pending.size(),4);
  for(const auto& item:pending){const auto bytes=event_bytes(item.event);out.insert(out.end(),bytes.begin(),bytes.end());put(out,item.conflict,1);}
  return out;
}
Digest Kernel::state_sha256()const{const auto bytes=canonical_state();return sha256(bytes);}

std::string run_fixture_json(std::uint64_t seed){
  auto build=[seed]{Kernel k(Config{4,4,32,2,{}});auto e=k.create_entity();
    k.set_component(e,0,seed);k.set_component(e,1,0);k.set_rule(e,Rule{2,3,1,0});return k;};
  auto first=build(),replay=build();std::array<Event,8> events{};
  for(unsigned i=0;i<events.size();++i)events[i]=Event{1+i,0,0,i+1,{0,1},Opcode::PairActRewrite64,0,0,i};
  for(const auto& e:events)if(first.enqueue(e)!=Status::Ok)throw std::runtime_error("Fixture admission failed");
  for(auto i=events.rbegin();i!=events.rend();++i)if(replay.enqueue(*i)!=Status::Ok)throw std::runtime_error("Replay admission failed");
  const auto a=first.commit_through(8),b=replay.commit_through(8);
  const auto ah=first.state_sha256(),bh=replay.state_sha256();
  std::ostringstream out;
  out<<"{\"profile\":\"TOM-ECS/1 generated paired-transition fixture\",\"source_conformance\":\"snapshot ordering only; not full XD-ECS/11\","
     <<"\"seed\":\""<<seed<<"\",\"applied\":"<<a.applied<<",\"replay_applied\":"<<b.applied
     <<",\"state_sha256\":\""<<hex_digest(ah)<<"\",\"replay_sha256\":\""<<hex_digest(bh)
     <<"\",\"equal\":"<<(ah==bh?"true":"false")<<",\"value_u64\":\""<<first.component({0,1},0)
     <<"\",\"rule_version\":\""<<first.rule({0,1}).version<<"\",\"physical_prediction\":false}";
  return out.str();
}
} // namespace edge_ai::ecs
