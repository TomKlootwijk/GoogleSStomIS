#pragma once

#include <cstddef>
#include <cstdint>
#include <deque>
#include <list>
#include <map>
#include <span>
#include <string>
#include <vector>

namespace edge_ai {

// Bounded arithmetic JIT, not a general-purpose C++ compiler. The only generated
// expression is bias + sum(weights[i] * features[i]), evaluated in index order.
class LinearJit {
 public:
  LinearJit(std::vector<double> weights, double bias = 0.0,
            bool prefer_native = true);
  ~LinearJit();
  LinearJit(const LinearJit&) = delete;
  LinearJit& operator=(const LinearJit&) = delete;
  LinearJit(LinearJit&& other) noexcept;
  LinearJit& operator=(LinearJit&& other) noexcept;
  double evaluate(std::span<const double> features) const;
  double interpreted(std::span<const double> features) const;
  const std::string& backend_name() const { return backend_; }
  const std::string& fallback_reason() const { return fallback_; }
  std::size_t feature_count() const { return weights_.size(); }

 private:
  void validate(std::span<const double> features) const;
  void compile_native();
  void release() noexcept;
  std::vector<double> weights_;
  double bias_;
  void* code_ = nullptr;
  std::size_t code_bytes_ = 0;
  using Function = double (*)(const double*);
  Function function_ = nullptr;
  std::string backend_ = "interpreter";
  std::string fallback_;
};

constexpr std::int64_t kTurnTicks = 360000000000LL;
struct D6 {
  unsigned rotation = 0;
  bool reflection = false;
  bool operator==(const D6&) const = default;
};
std::uint64_t apply_angle(std::uint64_t theta, D6 element);
D6 compose(D6 left, D6 right);
D6 inverse(D6 element);
unsigned transform_angle72(unsigned angle, D6 element);
unsigned canonical_angle72(unsigned angle);
std::uint64_t exact_log2_level(unsigned code);

struct LutSample {
  std::uint16_t q16 = 0;
  bool valid = false;
  bool operator==(const LutSample&) const = default;
};
class HexLut {
 public:
  static HexLut load(const std::string& bitplanes_file,
                     const std::string& validity_file);
  static HexLut decode(std::span<const std::uint8_t> planes,
                       std::span<const std::uint8_t> mask);
  LutSample at(unsigned row, unsigned angle) const;
  LutSample canonical_sample(unsigned row, unsigned angle) const;
  bool invariant() const { return invariant_; }
  std::size_t valid_count() const { return valid_count_; }
  // Decoding the Q16 source is separate from exact_log2_level. This function is
  // a floating-point approximation of the source inverse, not exact recovery.
  static double normalized_signal_approx(std::uint16_t q16);

 private:
  std::vector<LutSample> samples_;
  bool invariant_ = false;
  std::size_t valid_count_ = 0;
};

enum class Route { OfflineLookup, LocalModel, RemoteTool, Defer };
const char* route_name(Route route);

struct Limits {
  std::uint64_t max_model_bytes = 3ULL * 1024 * 1024 * 1024;
  std::size_t cache_entries = 128;
  std::uint64_t cache_ttl_ms = 5000;
};
struct Request {
  bool requires_model = false;
  bool requires_fresh_data = false;
  bool contains_private_data = true;
  std::uint64_t estimated_model_bytes = 0;
  std::uint64_t policy_revision = 1;
  std::string source_revision = "local-v1";
  std::string model_revision;
  double expected_gain = 1.0;
  double uncertainty = 0.5;
};
struct Conditions {
  std::uint64_t monotonic_ms = 0;
  std::uint64_t available_memory_bytes = 0;
  bool model_available = false;
  bool internet = false;
  bool metered = true;
  bool allow_metered = false;
  bool allow_remote = false;
  bool allow_private_remote = false;
  bool thermal_severe = false;
  std::uint64_t backend_revision = 1;
};
struct Decision {
  Route route = Route::Defer;
  double utility = 0.0;
  bool cache_hit = false;
  std::string reason;
};

// This class selects a route only; it never opens a network connection or
// launches generated commands. Callers must recheck capabilities when executing.
// State is single-thread confined; Android callers must serialize access.
class Runtime {
 public:
  explicit Runtime(Limits limits = {});
  Decision choose(const Request& request, const Conditions& conditions);
  const std::string& jit_backend() const { return scorer_.backend_name(); }
  const std::string& jit_fallback_reason() const { return scorer_.fallback_reason(); }
  std::size_t cache_size() const { return cache_.size(); }
  std::uint64_t cache_evictions() const { return evictions_; }
  void clear_cache();

 private:
  bool allowed(Route route, const Request&, const Conditions&) const;
  std::string key(const Request&, const Conditions&) const;
  struct Cached {
    Decision decision;
    std::uint64_t created_ms;
    std::list<std::string>::iterator lru;
  };
  Limits limits_;
  LinearJit scorer_;
  std::map<std::string, Cached> cache_;
  std::list<std::string> lru_;
  std::uint64_t last_time_ = 0;
  std::uint64_t evictions_ = 0;
};

struct Event {
  std::uint64_t sequence = 0;
  std::uint64_t monotonic_ms = 0;
  std::int64_t utc_ms = 0;
  std::string source;
  std::string text;
  bool private_data = true;
};
struct ContextSelection {
  std::vector<Event> events;
  std::size_t text_bytes = 0;
  std::size_t omitted = 0;
};
// A finite in-memory event ring. It is not a vector database or infinite model
// context. A new instance is required after a monotonic-clock session reset.
class ReplayMemory {
 public:
  ReplayMemory(std::size_t max_events = 128,
               std::size_t max_text_bytes = 256 * 1024);
  void append(Event event);
  ContextSelection select(const std::string& query, std::size_t text_budget,
                          std::uint64_t now_ms, std::uint64_t max_age_ms,
                          bool for_remote = false) const;
  std::size_t size() const { return events_.size(); }
  std::size_t text_bytes() const { return bytes_; }
  std::uint64_t evicted() const { return evicted_; }

 private:
  std::deque<Event> events_;
  std::size_t max_events_, max_bytes_, bytes_ = 0;
  std::uint64_t last_sequence_ = 0, last_time_ = 0, evicted_ = 0;
  bool has_event_ = false;
};

}  // namespace edge_ai
