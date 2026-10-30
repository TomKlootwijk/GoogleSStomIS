#include "edge_ai/core.hpp"

#include <array>
#include <cmath>
#include <fstream>
#include <iostream>
#include <limits>
#include <random>
#include <stdexcept>
#include <string>

namespace {
unsigned checks = 0;
void require(bool condition, const char* message) {
  ++checks;
  if (!condition) throw std::runtime_error(message);
}
template<class F> void rejects(F function, const char* message) {
  bool threw = false;
  try { function(); } catch (const std::exception&) { threw = true; }
  require(threw,message);
}
std::vector<std::uint8_t> bytes(const std::string& path) {
  std::ifstream in(path,std::ios::binary);
  if (!in) throw std::runtime_error("Missing fixture " + path);
  return {std::istreambuf_iterator<char>(in),std::istreambuf_iterator<char>()};
}
void test_jit() {
  std::mt19937_64 random(31998);
  std::uniform_real_distribution<double> value(-100.0,100.0);
  for (unsigned count = 1; count <= 16; ++count) {
    std::vector<double> weights(count), features(count);
    for (auto& x : weights) x = value(random);
    edge_ai::LinearJit compiled(weights,value(random));
    for (unsigned trial = 0; trial < 200; ++trial) {
      for (auto& x : features) x = value(random);
      require(compiled.evaluate(features) == compiled.interpreted(features),
              "Native/interpreted arithmetic differs");
    }
    if (count == 1) std::cout << "JIT backend: " << compiled.backend_name() << '\n';
  }
  edge_ai::LinearJit interpreter({2.0},1.0,false);
  require(interpreter.backend_name() == "interpreter", "Interpreter override ignored");
  require(interpreter.evaluate(std::array{3.0}) == 7.0,"Interpreter result");
  rejects([&] { interpreter.evaluate(std::array{std::numeric_limits<double>::quiet_NaN()}); },"NaN accepted");
  rejects([&] { interpreter.evaluate(std::array{std::numeric_limits<double>::infinity()}); },"Infinity accepted");
  rejects([&] { interpreter.evaluate(std::array{1.0,2.0}); },"Wrong dimension accepted");
  rejects([] { edge_ai::LinearJit invalid({},0); },"Empty feature vector accepted");
  rejects([] { edge_ai::LinearJit invalid({1e20},0); },"Unbounded weight accepted");
  edge_ai::LinearJit moved(std::move(interpreter));
  require(moved.evaluate(std::array{3.0}) == 7.0,"Move broke interpreter");
  edge_ai::LinearJit native({2.0,-3.0},5.0);
  edge_ai::LinearJit moved_native(std::move(native));
  require(moved_native.evaluate(std::array{4.0,2.0}) == 7.0,"Move broke native code ownership");
  moved = std::move(moved_native);
  require(moved.evaluate(std::array{4.0,2.0}) == 7.0,"Move assignment broke native code ownership");
}
void test_lognet(const std::string& directory) {
  using namespace edge_ai;
  for (unsigned k = 0; k < 6; ++k) for (bool b : {false,true}) {
    const D6 g{k,b};
    require(compose(g,inverse(g)) == D6{},"D6 inverse incorrect");
    for (unsigned l = 0; l < 6; ++l) for (bool c : {false,true}) {
      const D6 h{l,c};
      for (auto angle : {0ULL,1ULL,59999999999ULL,359999999999ULL})
        require(apply_angle(apply_angle(angle,h),g) == apply_angle(angle,compose(g,h)),"D6 action composition incorrect");
    }
    for (unsigned angle = 0; angle < 72; ++angle)
      require(canonical_angle72(angle) == canonical_angle72(transform_angle72(angle,g)),"D6 orbit canonicalization incorrect");
  }
  rejects([]{ apply_angle(kTurnTicks,{0,false}); },"Noncanonical angle accepted");
  rejects([]{ apply_angle(0,{6,false}); },"Invalid D6 rotation accepted");
  rejects([]{ transform_angle72(72,{0,false}); },"Invalid LUT angle accepted");
  require(exact_log2_level(0) == 0,"First exact level");
  require(exact_log2_level(63) == 9223372036854775807ULL,"Last exact level");
  rejects([]{ exact_log2_level(64); },"Invalid shift accepted");
  const auto levels = bytes(directory + "/log2_levels_bitmatrix.bin");
  require(levels.size() == 512,"Exact-level source file shape");
  for (unsigned code = 0; code < 64; ++code) {
    std::uint64_t stored = 0;
    for (unsigned j = 0; j < 8; ++j) stored = (stored << 8) | levels.at(code * 8 + j);
    require(stored == exact_log2_level(code),"Exact-level port differs from source bytes");
  }
  const auto planes = bytes(directory + "/hex_q16_bitplanes.bin");
  const auto mask = bytes(directory + "/hex_validity_bits.bin");
  const auto lut = HexLut::decode(planes,mask);
  require(lut.invariant(),"Source LUT is not D6 invariant");
  require(lut.valid_count() == 1158,"Wrong source validity count");
  for (unsigned r = 0; r < 17; ++r) for (unsigned a = 0; a < 72; ++a) {
    require(lut.at(r,a) == lut.canonical_sample(r,a),"Canonical sample changed payload/mask");
    for (unsigned k = 0; k < 6; ++k) for (bool b : {false,true})
      require(lut.at(r,a) == lut.at(r,transform_angle72(a,{k,b})),"Source symmetry false");
  }
  auto corrupted = planes;
  corrupted[0] ^= 0x80; // Change valid node zero in only one orbit position.
  const auto asymmetric = HexLut::decode(corrupted,mask);
  require(!asymmetric.invariant(),"Asymmetric LUT falsely certified");
  rejects([&]{ asymmetric.canonical_sample(0,0); },"Unverified symmetry used");
  const std::vector<std::uint8_t> zero_planes(2448,0);
  std::vector<std::uint8_t> one_valid_mask(153,0);
  one_valid_mask[0] = 0x80;
  const auto zero_lut = HexLut::decode(zero_planes,one_valid_mask);
  require(zero_lut.at(0,0) == LutSample{0,true},"Valid zero was lost");
  require(zero_lut.at(0,1) == LutSample{0,false},"Invalid zero treated as measured zero");
  std::vector<std::uint8_t> bad_zero_planes(2448,0);
  bad_zero_planes[0] = 0x40;
  rejects([&]{ HexLut::decode(bad_zero_planes,one_valid_mask); },"Nonzero invalid payload accepted");
  require(std::abs(HexLut::normalized_signal_approx(65535)-15.0) < 1e-12,"Q16 inverse endpoint");
  require(HexLut::normalized_signal_approx(0) == 0,"Q16 inverse zero");
}
void test_dispatch() {
  using namespace edge_ai;
  Runtime runtime(Limits{1024,2,50});
  Request request;
  Conditions conditions;
  conditions.monotonic_ms = 100;
  require(runtime.choose(request,conditions).route == Route::OfflineLookup,"Default should be offline");
  require(runtime.choose(request,conditions).cache_hit,"Repeat should hit cache");
  request.requires_fresh_data = true;
  require(runtime.choose(request,conditions).route == Route::Defer,"Offline cannot satisfy live request");
  conditions.internet = true;
  conditions.allow_remote = true;
  conditions.allow_metered = true;
  require(runtime.choose(request,conditions).route == Route::Defer,"Private remote gate ignored");
  conditions.allow_private_remote = true;
  require(runtime.choose(request,conditions).route == Route::RemoteTool,"Authorized live route unavailable");
  require(runtime.choose(request,conditions).cache_hit,"Remote route cache absent");
  conditions.allow_remote = false;
  require(runtime.choose(request,conditions).route == Route::Defer,"Revocation bypassed by cache");
  conditions.allow_remote = true;
  conditions.allow_metered = false;
  require(runtime.choose(request,conditions).route == Route::Defer,"Metered guard bypassed by cache");
  conditions.allow_metered = true;
  conditions.thermal_severe = true;
  require(runtime.choose(request,conditions).route == Route::Defer,"Thermal guard ignored");
  conditions.thermal_severe = false;
  request.requires_fresh_data = false;
  request.requires_model = true;
  request.model_revision = "model@commit-a";
  request.estimated_model_bytes = 512;
  conditions.model_available = true;
  conditions.available_memory_bytes = 1024;
  conditions.allow_remote = false;
  require(runtime.choose(request,conditions).route == Route::LocalModel,"Local model route unavailable");
  conditions.available_memory_bytes = 511;
  require(runtime.choose(request,conditions).route == Route::Defer,"Model memory guard ignored");
  conditions.available_memory_bytes = 1024;
  request.model_revision = "model@commit-b";
  require(!runtime.choose(request,conditions).cache_hit,"Model revision not in cache key");
  require(runtime.choose(request,conditions).cache_hit,"Changed model cache did not stabilize");
  request.source_revision = "source-v2";
  require(!runtime.choose(request,conditions).cache_hit,"Source revision not in cache key");
  ++request.policy_revision;
  require(!runtime.choose(request,conditions).cache_hit,"Policy revision not in cache key");
  ++conditions.backend_revision;
  require(!runtime.choose(request,conditions).cache_hit,"Backend revision not in cache key");
  require(runtime.cache_size() <= 2 && runtime.cache_evictions() > 0,"Cache not bounded");
  conditions.monotonic_ms = 151;
  require(!runtime.choose(request,conditions).cache_hit,"Expired decision reused");
  conditions.monotonic_ms = 150;
  rejects([&]{runtime.choose(request,conditions);},"Regressing runtime clock accepted");
  conditions.monotonic_ms = 151;
  request.expected_gain = std::numeric_limits<double>::quiet_NaN();
  rejects([&]{runtime.choose(request,conditions);},"NaN utility accepted");
}
void test_memory() {
  using namespace edge_ai;
  ReplayMemory memory(3,64);
  memory.append({1,100,5000,"fixture","public satellite",false});
  memory.append({2,101,1000,"fixture","private location",true}); // Wall-clock regressions do not change ordering.
  memory.append({3,102,6000,"fixture","public map",false});
  auto remote = memory.select("location",64,102,100,true);
  require(remote.events.size() == 2,"Private event included in remote context");
  for (const auto& e : remote.events) require(!e.private_data,"Remote privacy filter failed");
  auto relevant = memory.select("location",16,102,100,false);
  require(relevant.events.size() == 1 && relevant.events[0].sequence == 2,"Retrieval priority or byte budget wrong");
  memory.append({4,103,7000,"fixture","new public event",false});
  require(memory.size() == 3 && memory.evicted() == 1,"Event ring not bounded");
  require(memory.text_bytes() <= 64,"Text memory bound violated");
  require(memory.select("",64,200,10).events.empty(),"Expired events selected");
  rejects([&]{ memory.append({4,104,0,"fixture","duplicate",false}); },"Duplicate accepted");
  rejects([&]{ memory.append({5,102,0,"fixture","regression",false}); },"Regressing event clock accepted");
  rejects([&]{ memory.select("",64,102,100); },"Future event selected");
  rejects([&]{ memory.append({5,104,0,"fixture",std::string(65,'x'),false}); },"Oversized event accepted");
}
}  // namespace

int main(int argc,char** argv) {
  try {
    test_jit();
    test_lognet(argc > 1 ? argv[1] : "assets/lognet");
    test_dispatch();
    test_memory();
    std::cout << "PASS: " << checks << " checks\n";
  } catch (const std::exception& error) {
    std::cerr << "FAIL after " << checks << " checks: " << error.what() << '\n';
    return 1;
  }
}
