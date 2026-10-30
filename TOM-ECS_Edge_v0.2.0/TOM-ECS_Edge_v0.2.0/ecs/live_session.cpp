#include "edge_ai/live_session.hpp"
#include "edge_ai/ecs.hpp"
#include "tnm_native.h"

#include <array>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <string_view>

namespace edge_ai::ecs {
namespace {
constexpr std::uint64_t kMinimumAvailableBytes=256ULL*1024*1024;
constexpr std::uint32_t kMaximumAdmittedThermal=2;
constexpr std::uint32_t kKnownThermalMaximum=6;
constexpr std::string_view kContract=
    "TOM-LIVE-SESSION/1\n"
    "telemetry:available_memory_bytes:u64;accel_micro_ms2:i64;accel_valid:bool;thermal_status:u32\n"
    "four_Set64_events;source0;sequence4*(epoch-1)+1..4\n"
    "eight_pinned_profiles;source1..8;sequence=epoch;retained_default_inputs\n"
    "admit:memory>=268435456;thermal<=2;known_thermal0..6\n"
    "capabilities:Mutate|NativeModel;budget:12events,1000000abstract_operations\n"
    "clock:explicit_logical_epoch;no_sensor_to_model_quantity_conversion\n";

Config configuration(){
  const auto bytes=std::span(reinterpret_cast<const std::uint8_t*>(kContract.data()),kContract.size());
  return Config{9,16,12,9,sha256(bytes)};
}
std::string quoted(std::string_view text){
  constexpr char hex[]="0123456789abcdef";
  std::string out="\"";
  for(unsigned char c:text){
    if(c=='"'||c=='\\'){out+='\\';out+=static_cast<char>(c);}
    else if(c<32){out+="\\u00";out+=hex[c>>4];out+=hex[c&15];}
    else out+=static_cast<char>(c);
  }
  out+='"';return out;
}
}

struct LiveSession::Impl {
  Kernel kernel{configuration()};
  std::uint64_t epoch=0;
  std::array<EntityId,9> entities{};

  Impl(){
    if(tnm_profile_count()!=8)throw std::runtime_error("Live session requires the pinned eight-profile registry");
    for(auto& entity:entities)entity=kernel.create_entity();
    kernel.set_component(entities[0],0,0);
    kernel.set_component(entities[0],1,0);
    kernel.set_component(entities[0],2,0);
    kernel.set_component(entities[0],3,std::numeric_limits<std::uint32_t>::max());
    for(std::uint32_t i=0;i<8;++i){
      const auto* profile=tnm_profile(i);
      if(!profile)throw std::runtime_error("Pinned native profile unavailable");
      kernel.attach_native_profile(entities[i+1],profile->id);
    }
  }
};

LiveSession::LiveSession():impl_(std::make_unique<Impl>()){}
LiveSession::~LiveSession()=default;
LiveSession::LiveSession(LiveSession&&)noexcept=default;
LiveSession& LiveSession::operator=(LiveSession&&)noexcept=default;
std::uint64_t LiveSession::epoch()const noexcept{return impl_?impl_->epoch:0;}

std::string LiveSession::observe_json(std::uint64_t memory,std::int64_t acceleration,
                                    bool valid,std::uint32_t thermal){
  if(!impl_)throw std::logic_error("Moved-from live session");
  auto& session=*impl_;
  if(session.epoch>=std::numeric_limits<std::uint64_t>::max()/4)
    throw std::overflow_error("Explicit live-session epoch/sequence capacity exhausted");
  const auto next=session.epoch+1;
  const char* admission="admitted";
  if(thermal>kKnownThermalMaximum)admission="unknown_thermal_status";
  else if(thermal>kMaximumAdmittedThermal)admission="thermal_limit";
  else if(memory<kMinimumAvailableBytes)admission="available_memory_limit";
  const bool admitted=std::string_view(admission)=="admitted";

  const std::array<std::uint64_t,4> observations={memory,static_cast<std::uint64_t>(acceleration),valid?1ULL:0ULL,thermal};
  for(std::uint16_t component=0;component<observations.size();++component){
    const Event e{next,0,0,4*(next-1)+component+1,session.entities[0],
                  Opcode::Set64,component,0,observations[component]};
    if(session.kernel.enqueue(e)!=Status::Ok)throw std::runtime_error("Live telemetry admission failed");
  }
  if(admitted)for(std::uint32_t i=0;i<8;++i){
    const Event e{next,i+1,0,next,session.entities[i+1],Opcode::NativeProfileStep,0,0,0};
    if(session.kernel.enqueue(e)!=Status::Ok)throw std::runtime_error("Live source-profile admission failed");
  }
  const auto report=session.kernel.commit_through(next,Capabilities{Mutate|NativeModel},WorkBudget{12,1000000});
  if(report.status!=Status::Ok)throw std::runtime_error(std::string("Live commit failed: ")+status_name(report.status));
  session.epoch=next;

  std::ostringstream out;
  out<<"{\"schema\":\"TOM-LIVE-SESSION/1\",\"epoch\":\""<<next
     <<"\",\"clock\":\"explicit_logical_epoch\",\"state_sha256\":\""<<hex_digest(session.kernel.state_sha256())
     <<"\",\"observed_input\":{\"available_memory_bytes\":\""<<memory
     <<"\",\"accel_micro_ms2\":\""<<acceleration<<"\",\"accel_valid\":"<<(valid?"true":"false")
     <<",\"thermal_status\":"<<thermal<<"},\"admission\":{\"native_admitted\":"<<(admitted?"true":"false")
     <<",\"reason\":"<<quoted(admission)<<",\"minimum_available_bytes\":\""<<kMinimumAvailableBytes
     <<"\",\"maximum_thermal_status\":"<<kMaximumAdmittedThermal
     <<",\"native_input_mode\":\"retained_source_default\",\"telemetry_injected_into_models\":false},"
     <<"\"processed\":"<<report.processed<<",\"applied\":"<<report.applied<<",\"rejected\":"<<report.rejected
     <<",\"abstract_work_units\":"<<report.operations<<",\"modules\":[";
  bool first=true;
  for(const auto& state:session.kernel.native_profile_states()){
    const auto* info=tnm_find_profile(state.profile_id.c_str());
    if(!first)out<<',';
    first=false;
    out<<"{\"entity_slot\":"<<state.entity.slot<<",\"profile\":"<<quoted(state.profile_id)
       <<",\"attempted_this_epoch\":"<<(admitted?"true":"false")
       <<",\"sequence\":\""<<state.sequence<<"\",\"last_status\":"<<state.last_status
       <<",\"last_trap\":"<<state.last_trap<<",\"full_memory_sha256\":"<<quoted(state.memory_sha256);
    if(info)out<<",\"source_clock\":"<<quoted(info->clock)<<",\"input_type\":"<<quoted(info->input_type)
               <<",\"input_unit\":"<<quoted(info->input_unit)<<",\"output_type\":"<<quoted(info->output_type)
               <<",\"output_unit\":"<<quoted(info->output_unit);
    out<<'}';
  }
  out<<"],\"replay_contract\":\"Construct a fresh session; submit these observed_input records in epoch order under TOM-LIVE-SESSION/1. Record skipped acquisition separately.\"}";
  return out.str();
}

} // namespace edge_ai::ecs
