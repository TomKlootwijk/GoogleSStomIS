#include "edge_ai/bundle.hpp"
#include "edge_ai/ecs.hpp"
#include "edge_ai/core.hpp"
#include "tnm_native.h"

#include <algorithm>
#include <array>
#include <limits>
#include <optional>
#include <sstream>
#include <stdexcept>
#include <vector>

namespace edge_ai::bundle {
namespace {
using Bytes = std::span<const std::uint8_t>;
using ecs::Digest;

[[noreturn]] void fail(const char* message) { throw std::runtime_error(message); }
void require(bool condition, const char* message) { if (!condition) fail(message); }
std::uint64_t le(Bytes bytes, std::size_t offset, std::size_t width) {
  require(width <= 8 && offset <= bytes.size() && width <= bytes.size()-offset,
          "truncated integer");
  std::uint64_t value = 0;
  for (std::size_t i=0;i<width;++i) value |= std::uint64_t(bytes[offset+i]) << (8*i);
  return value;
}
bool zero(Bytes bytes) { return std::all_of(bytes.begin(),bytes.end(),[](auto x){return x==0;}); }
Digest digest_at(Bytes bytes, std::size_t offset) {
  require(offset <= bytes.size() && 32 <= bytes.size()-offset,"truncated digest");
  Digest d{}; std::copy_n(bytes.begin()+static_cast<std::ptrdiff_t>(offset),32,d.begin());
  return d;
}
std::size_t align8(std::size_t n) { return (n+7U)&~std::size_t(7); }
std::string escape(const std::string& s) {
  std::string result;
  constexpr char hex[]="0123456789abcdef";
  for (const unsigned char c:s) {
    if (c=='"' || c=='\\') { result.push_back('\\'); result.push_back(static_cast<char>(c)); }
    else if(c<32) { result+="\\u00"; result+=hex[c>>4]; result+=hex[c&15]; }
    else result.push_back(static_cast<char>(c));
  }
  return result;
}
struct Section { std::uint32_t type=0,count=0,stride=0; Bytes bytes; Digest digest{}; };
struct Package {
  Digest root{};
  std::array<std::optional<Section>,11> sections;
  ecs::Config config;
  ecs::Capabilities capabilities;
  ecs::WorkBudget budget;
  std::uint64_t through=0;
  const Section& get(unsigned i) const {
    require(i<sections.size() && sections[i].has_value(),"missing required section");
    return *sections[i];
  }
};

Package parse(Bytes bytes) {
  require(bytes.size()>=96 && bytes.size()<=kMaximumBytes,"package size outside [96,16MiB]");
  constexpr std::array<std::uint8_t,8> magic={'T','O','M','E','C','S','1',0};
  require(std::equal(magic.begin(),magic.end(),bytes.begin()),"bad TOM-ECS/1 magic");
  require(le(bytes,8,2)==1 && le(bytes,10,2)==0,"unsupported package version");
  require(le(bytes,12,4)==96 && le(bytes,28,4)==64,"unsupported framing sizes");
  require(le(bytes,16,8)==bytes.size(),"file length mismatch");
  require(zero(bytes.subspan(64,32)),"nonzero header reserved bytes");
  const auto count=static_cast<std::size_t>(le(bytes,24,4));
  require(count>=6 && count<=10,"section count outside v1 bounds");
  require(bytes.size()>=96+64*count,"truncated directory");
  Package p;
  p.root=digest_at(bytes,32);
  std::vector<std::uint8_t> root_input(bytes.begin(),bytes.end());
  std::fill(root_input.begin()+32,root_input.begin()+64,0);
  require(ecs::sha256(root_input)==p.root,"root SHA-256 mismatch");
  std::size_t end=96+64*count;
  std::uint32_t previous_type=0;
  for (std::size_t i=0;i<count;++i) {
    const auto d=96+64*i;
    const auto type=static_cast<std::uint32_t>(le(bytes,d,4));
    require(type>previous_type && type<11,"unknown, duplicate or unsorted section type");
    require(le(bytes,d+4,4)==0,"unsupported section flags");
    const auto offset=le(bytes,d+8,8),length=le(bytes,d+16,8);
    require(offset==align8(end),"sections must be contiguous and 8-byte aligned");
    require(offset<=bytes.size() && length<=bytes.size()-offset,"section outside file");
    require(zero(bytes.subspan(end,static_cast<std::size_t>(offset)-end)),"nonzero section padding");
    Section s;
    s.type=type;
    s.count=static_cast<std::uint32_t>(le(bytes,d+24,4));
    s.stride=static_cast<std::uint32_t>(le(bytes,d+28,4));
    s.bytes=bytes.subspan(static_cast<std::size_t>(offset),static_cast<std::size_t>(length));
    s.digest=digest_at(bytes,d+32);
    require(ecs::sha256(s.bytes)==s.digest,"section SHA-256 mismatch");
    if(s.stride!=0) require(std::uint64_t(s.count)*s.stride==length,"record count/stride mismatch");
    else require(s.count==1,"opaque section count must equal one");
    p.sections[type]=s;
    previous_type=type;
    end=static_cast<std::size_t>(offset+length);
  }
  require(end==bytes.size(),"trailing bytes");
  for (unsigned i=1;i<=6;++i) (void)p.get(i);
  require(p.get(1).stride==0 && !p.get(1).bytes.empty() && p.get(1).bytes.size()<=1024*1024,
          "manifest must be a nonempty opaque section <=1MiB");
  const auto& c=p.get(2);
  require(c.bytes.size()==64 && c.count==1 && c.stride==64,"configuration must be Config64");
  p.config.entity_capacity=static_cast<std::uint32_t>(le(c.bytes,0,4));
  p.config.component_count=static_cast<std::uint32_t>(le(c.bytes,4,4));
  p.config.event_capacity=static_cast<std::uint32_t>(le(c.bytes,8,4));
  p.config.source_capacity=static_cast<std::uint32_t>(le(c.bytes,12,4));
  require(p.config.entity_capacity>=1 && p.config.entity_capacity<=1024,"entity limit");
  require(p.config.component_count>=16 && p.config.component_count<=64,"component limit");
  require(std::uint64_t(p.config.entity_capacity)*p.config.component_count<=65536,"component storage limit");
  require(p.config.event_capacity>=1 && p.config.event_capacity<=65536,"event limit");
  require(p.config.source_capacity>=1 && p.config.source_capacity<=32,"source limit");
  p.through=le(c.bytes,16,8);
  p.capabilities.allowed=le(c.bytes,24,8);
  require((p.capabilities.allowed & ~std::uint64_t(ecs::AllLocal))==0,"unknown capability bits");
  p.budget.max_events=le(c.bytes,32,8); p.budget.max_operations=le(c.bytes,40,8);
  require(p.budget.max_events<=65536 && p.budget.max_operations<=10000000,"work budget limit");
  require(zero(c.bytes.subspan(48,16)),"nonzero configuration reserved bytes");
  p.config.contract_digest=p.root;
  require(p.get(3).stride==48 && p.get(3).count<=p.config.entity_capacity,"initial Entity48 limit");
  require(p.get(4).stride==16 && p.get(4).count<=65536,"Component16 limit");
  require(p.get(5).stride==48 && p.get(5).count<=p.config.event_capacity,"Event48 limit");
  require(p.get(6).stride==8 && p.get(6).count==p.config.source_capacity,"Source8 limit");
  if(p.sections[7]) require(p.get(7).stride==0 && p.get(7).bytes.size()>=128,"invalid TOMAGI section");
  require(p.sections[8].has_value()==p.sections[9].has_value(),"LUT planes and mask must be paired");
  if(p.sections[8]) require(p.get(8).stride==0 && p.get(8).bytes.size()==2448 &&
                          p.get(9).stride==0 && p.get(9).bytes.size()==153,"invalid source LUT size");
  if(p.sections[10]) require(p.get(10).stride==48 && p.get(10).count<=8,"NativeBinding48 limit");
  return p;
}

struct Result {
  Digest state{}; ecs::CommitReport report;
  std::vector<std::pair<std::uint32_t,std::array<std::uint64_t,16>>> tomagi;
  std::vector<ecs::NativeProfileState> native;
  std::uint64_t components=0;
  std::uint64_t incomplete_tomagi=0;
};
Result run(const Package& p) {
  ecs::Kernel kernel(p.config);
  std::optional<edge_ai::HexLut> lut;
  if(p.sections[8]) {
    lut=edge_ai::HexLut::decode(p.get(8).bytes,p.get(9).bytes);
    require(lut->invariant(),"source LUT not D6 invariant");
    kernel.attach_lut(*lut);
  }
  if(p.sections[7]) kernel.attach_tomagi(p.get(7).bytes);
  const auto& sources=p.get(6);
  for(std::uint32_t i=0;i<sources.count;++i) {
    require(le(sources.bytes,8*i,4)==i,"Source8 ids must be dense and sorted");
    kernel.set_source_epoch(i,static_cast<std::uint32_t>(le(sources.bytes,8*i+4,4)));
  }
  std::vector<ecs::EntityId> entities;
  std::vector<bool> tomagi_entities;
  const auto& initial=p.get(3);
  entities.reserve(initial.count); tomagi_entities.reserve(initial.count);
  for(std::uint32_t i=0;i<initial.count;++i) {
    const auto b=initial.bytes.subspan(std::size_t(i)*48,48);
    require(le(b,0,4)==i && le(b,4,4)==1,"initial Entity48 must use dense slots and generation one");
    const auto flags=le(b,8,4);
    require(flags<=1 && le(b,12,4)==0,"invalid Entity48 flags/reserved bytes");
    auto entity=kernel.create_entity();
    require(entity.slot==i && entity.generation==1,"unexpected entity allocation");
    ecs::Rule r{le(b,16,8),le(b,24,8),le(b,32,8),le(b,40,8)};
    require(r.version>=1 && r.reserved==0,"invalid Rule32");
    kernel.set_rule(entity,r);
    if(flags) { require(p.sections[7].has_value(),"TOMAGI initialization without module"); kernel.initialize_tomagi_entity(entity); }
    entities.push_back(entity); tomagi_entities.push_back(flags!=0);
  }
  if(p.sections[10]) {
    const auto& bindings=p.get(10);
    std::uint32_t previous_slot=0;
    std::uint64_t memory_bytes=0;
    for(std::uint32_t i=0;i<bindings.count;++i) {
      const auto b=bindings.bytes.subspan(std::size_t(i)*48,48);
      const auto slot=static_cast<std::uint32_t>(le(b,0,4));
      const auto index=static_cast<std::uint32_t>(le(b,4,4));
      require(slot<entities.size() && (i==0 || slot>previous_slot),"native bindings must have sorted unique initial entities");
      require(le(b,40,8)==0,"nonzero native binding reserved bytes");
      require(index<tnm_profile_count(),"native profile index unavailable");
      const auto* info=tnm_profile(index);
      require(info!=nullptr,"native profile unavailable");
      const std::string identity=std::string("TNM-PROFILE/1\n")+info->id+"\n"+
          info->wasm_sha256+"\n"+info->recipe_sha256+"\n"+info->bootstrap_sha256+"\n";
      const auto fingerprint=ecs::sha256(Bytes(reinterpret_cast<const std::uint8_t*>(identity.data()),identity.size()));
      require(fingerprint==digest_at(b,8),"native profile identity/byte contract mismatch");
      memory_bytes+=info->memory_bytes;
      require(memory_bytes<=8ULL*1024*1024,"native memory budget exceeded");
      kernel.attach_native_profile(entities[slot],info->id);
      previous_slot=slot;
    }
  }
  const auto& components=p.get(4);
  std::uint64_t previous_component=0;
  for(std::uint32_t i=0;i<components.count;++i) {
    const auto b=components.bytes.subspan(std::size_t(i)*16,16);
    const auto slot=le(b,0,4), component=le(b,4,2);
    require(slot<entities.size() && component<p.config.component_count && le(b,6,2)==0,"invalid Component16");
    const auto key=slot*65536+component;
    require(i==0 || key>previous_component,"Component16 keys must be unique and sorted");
    kernel.set_component(entities[slot],static_cast<std::uint16_t>(component),le(b,8,8));
    previous_component=key;
  }
  const auto& events=p.get(5);
  ecs::Event previous;
  for(std::uint32_t i=0;i<events.count;++i) {
    const auto b=events.bytes.subspan(std::size_t(i)*48,48);
    ecs::Event e;
    e.logical_tick=le(b,0,8); e.source_id=static_cast<std::uint32_t>(le(b,8,4));
    e.source_epoch=static_cast<std::uint32_t>(le(b,12,4)); e.sequence=le(b,16,8);
    e.target={static_cast<std::uint32_t>(le(b,24,4)),static_cast<std::uint32_t>(le(b,28,4))};
    e.opcode=static_cast<ecs::Opcode>(le(b,32,2)); e.component=static_cast<std::uint16_t>(le(b,34,2));
    e.flags=static_cast<std::uint32_t>(le(b,36,4)); e.argument=le(b,40,8);
    require(e.logical_tick<=p.through,"event beyond package frontier");
    require(i==0 || (e.logical_tick>previous.logical_tick) ||
      (e.logical_tick==previous.logical_tick && e.source_id>previous.source_id) ||
      (e.logical_tick==previous.logical_tick && e.source_id==previous.source_id && e.sequence>previous.sequence),
      "Event48 must be strictly ordered by (tick,source,sequence)");
    const auto status=kernel.enqueue(e);
    require(status==ecs::Status::Ok,ecs::status_name(status));
    previous=e;
  }
  Result result;
  result.report=kernel.commit_through(p.through,p.capabilities,p.budget);
  require(result.report.status==ecs::Status::Ok,ecs::status_name(result.report.status));
  require(kernel.queued()==0,"uncommitted package events");
  result.state=kernel.state_sha256();
  result.native=kernel.native_profile_states();
  for(std::uint32_t slot=0;slot<p.config.entity_capacity;++slot) {
    const auto entity=kernel.current_entity(slot);
    if(!entity) continue;
    for(std::uint16_t c=0;c<p.config.component_count;++c) if(kernel.has_component(*entity,c)) ++result.components;
  }
  for(std::size_t i=0;i<entities.size();++i) {
    if(!kernel.alive(entities[i])) continue;
    if(tomagi_entities[i]) {
      bool complete=true;
      for(std::uint16_t c=0;c<16;++c) complete=complete&&kernel.has_component(entities[i],c);
      if(!complete) { ++result.incomplete_tomagi; continue; }
      std::array<std::uint64_t,16> state{};
      for(std::uint16_t c=0;c<16;++c) state[c]=kernel.component(entities[i],c);
      result.tomagi.emplace_back(entities[i].slot,state);
    }
  }
  return result;
}
}  // namespace

std::string inspect_and_replay_json(std::span<const std::uint8_t> bytes) {
  try {
    const auto p=parse(bytes);
    const auto a=run(p), b=run(p);
    require(a.state==b.state,"native replay state mismatch");
    std::ostringstream out;
    out << "{\"ok\":true,\"format\":\"TOM-ECS/1\",\"profile\":\"native-phone-v1\","
        << "\"full_xd_ecs_11\":false,\"bytes\":" << bytes.size()
        << ",\"package_sha256\":\"" << ecs::hex_digest(p.root)
        << "\",\"manifest_sha256\":\"" << ecs::hex_digest(p.get(1).digest)
        << "\",\"state_sha256\":\"" << ecs::hex_digest(a.state)
        << "\",\"replay_equal\":true,\"frontier\":" << p.through
        << ",\"events\":" << a.report.processed << ",\"applied\":" << a.report.applied
        << ",\"rejected\":" << a.report.rejected << ",\"operations\":" << a.report.operations
        << ",\"live_components\":" << a.components
        << ",\"native_profiles\":" << (p.sections[10]?p.get(10).count:0)
        << ",\"incomplete_tomagi_states\":" << a.incomplete_tomagi << ",\"tomagi_states\":[";
    bool first=true;
    for(const auto& [slot,state]:a.tomagi) {
      if(!first) out << ',';
      first=false; out << "{\"entity\":" << slot << ",\"words\":[";
      for(std::size_t i=0;i<state.size();++i) { if(i) out << ','; out << state[i]; }
      out << "]}";
    }
    out << "],\"native_states\":[";
    first=true;
    for(const auto& state:a.native) {
      if(!first) out << ',';
      first=false;
      out << "{\"entity\":" << state.entity.slot
          << ",\"profile_id\":\"" << escape(state.profile_id)
          << "\",\"sequence\":" << state.sequence
          << ",\"full_memory_sha256\":\"" << state.memory_sha256
          << "\",\"last_status\":" << state.last_status
          << ",\"last_trap\":" << state.last_trap << '}';
    }
    out << "]}";
    return out.str();
  } catch(const std::exception& e) {
    return "{\"ok\":false,\"format\":\"TOM-ECS/1\",\"error\":\""+escape(e.what())+"\"}";
  }
}
}  // namespace edge_ai::bundle
