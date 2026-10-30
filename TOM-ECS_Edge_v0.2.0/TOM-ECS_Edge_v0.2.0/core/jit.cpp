#include "edge_ai/core.hpp"

#include <algorithm>
#include <cmath>
#include <cstring>
#include <limits>
#include <stdexcept>
#include <utility>

#if defined(__unix__) || defined(__ANDROID__)
#include <sys/mman.h>
#include <unistd.h>
#endif

namespace edge_ai {
namespace {
constexpr std::size_t kMaxFeatures = 16;
constexpr double kMaxMagnitude = 1.0e6;
void u32(std::vector<std::uint8_t>& out, std::uint32_t x) {
  for (unsigned i = 0; i < 4; ++i) out.push_back((x >> (8 * i)) & 255);
}
void patch32(std::vector<std::uint8_t>& out, std::size_t at, std::uint32_t x) {
  for (unsigned i = 0; i < 4; ++i) out.at(at + i) = (x >> (8 * i)) & 255;
}
std::size_t constant(std::vector<std::uint8_t>& out, double x) {
  while (out.size() % 8) out.push_back(0);
  const auto at = out.size();
  std::uint64_t bits;
  static_assert(sizeof(bits) == sizeof(x));
  std::memcpy(&bits, &x, sizeof(x));
  for (unsigned i = 0; i < 8; ++i) out.push_back((bits >> (8 * i)) & 255);
  return at;
}
bool bounded(double x) { return std::isfinite(x) && std::abs(x) <= kMaxMagnitude; }
}  // namespace

LinearJit::LinearJit(std::vector<double> weights, double bias, bool prefer_native)
    : weights_(std::move(weights)), bias_(bias) {
  if (weights_.empty() || weights_.size() > kMaxFeatures || !bounded(bias_) ||
      !std::all_of(weights_.begin(), weights_.end(), bounded))
    throw std::invalid_argument("JIT requires 1..16 finite bounded weights and bias");
  if (prefer_native) compile_native();
  else fallback_ = "Native execution explicitly disabled";
}
LinearJit::~LinearJit() { release(); }
LinearJit::LinearJit(LinearJit&& other) noexcept
    : weights_(std::move(other.weights_)), bias_(other.bias_),
      code_(std::exchange(other.code_, nullptr)),
      code_bytes_(std::exchange(other.code_bytes_, 0)),
      function_(std::exchange(other.function_, nullptr)),
      backend_(std::move(other.backend_)), fallback_(std::move(other.fallback_)) {}
LinearJit& LinearJit::operator=(LinearJit&& other) noexcept {
  if (this != &other) {
    release();
    weights_ = std::move(other.weights_);
    bias_ = other.bias_;
    code_ = std::exchange(other.code_, nullptr);
    code_bytes_ = std::exchange(other.code_bytes_, 0);
    function_ = std::exchange(other.function_, nullptr);
    backend_ = std::move(other.backend_);
    fallback_ = std::move(other.fallback_);
  }
  return *this;
}
void LinearJit::release() noexcept {
#if defined(__unix__) || defined(__ANDROID__)
  if (code_) munmap(code_, code_bytes_);
#endif
  code_ = nullptr;
  function_ = nullptr;
  code_bytes_ = 0;
}
void LinearJit::validate(std::span<const double> x) const {
  if (x.size() != weights_.size() ||
      !std::all_of(x.begin(), x.end(), bounded))
    throw std::invalid_argument("JIT feature dimension or finite bound violation");
}
double LinearJit::interpreted(std::span<const double> x) const {
  validate(x);
  double y = bias_;
  // Volatile temporary preserves the stated multiply-then-add behavior even if
  // a downstream build enables FP contraction; native backends do not use FMA.
  for (std::size_t i = 0; i < x.size(); ++i) {
    volatile double term = weights_[i] * x[i];
    y = y + term;
  }
  return y;
}
double LinearJit::evaluate(std::span<const double> x) const {
  validate(x);
  const double y = function_ ? function_(x.data()) : interpreted(x);
  if (!std::isfinite(y)) throw std::runtime_error("Nonfinite JIT result");
  return y;
}
void LinearJit::compile_native() {
#if (defined(__unix__) || defined(__ANDROID__)) && (defined(__x86_64__) || defined(__aarch64__)) && !defined(__APPLE__) && (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)
  std::vector<std::uint8_t> bytes;
  struct Reference { std::size_t at; double value; };
  std::vector<Reference> refs;
#if defined(__x86_64__)
  // System V: const double* arrives in RDI, result is returned in XMM0.
  // ENDBR64 is a no-op on CPUs without CET and supports indirect branch tracking.
  bytes.insert(bytes.end(), {0xf3, 0x0f, 0x1e, 0xfa});
  bytes.insert(bytes.end(), {0xf2, 0x0f, 0x10, 0x05});  // movsd xmm0,[rip+disp32]
  refs.push_back({bytes.size(), bias_}); u32(bytes, 0);
  for (std::size_t i = 0; i < weights_.size(); ++i) {
    bytes.insert(bytes.end(), {0xf2, 0x0f, 0x10, 0x8f});  // movsd xmm1,[rdi+disp32]
    u32(bytes, static_cast<std::uint32_t>(i * 8));
    bytes.insert(bytes.end(), {0xf2, 0x0f, 0x59, 0x0d});  // mulsd xmm1,[rip+disp32]
    refs.push_back({bytes.size(), weights_[i]}); u32(bytes, 0);
    bytes.insert(bytes.end(), {0xf2, 0x0f, 0x58, 0xc1});  // addsd xmm0,xmm1
  }
  bytes.push_back(0xc3);
  for (const auto& ref : refs) {
    const auto at = constant(bytes, ref.value);
    patch32(bytes, ref.at, static_cast<std::uint32_t>(at - (ref.at + 4)));
  }
#else
  // AAPCS64: X0 is input pointer, D0 is result. BTI C is a harmless hint if BTI
  // is unavailable. Literal offsets are relative to the LDR instruction itself.
  u32(bytes, 0xd503245fU);  // bti c
  refs.push_back({bytes.size(), bias_}); u32(bytes, 0x5c000000U);  // ldr d0,literal
  for (std::size_t i = 0; i < weights_.size(); ++i) {
    u32(bytes, 0xfd400001U | (static_cast<std::uint32_t>(i) << 10));  // ldr d1,[x0,#8*i]
    refs.push_back({bytes.size(), weights_[i]}); u32(bytes, 0x5c000002U); // ldr d2,literal
    u32(bytes, 0x1e620821U);  // fmul d1,d1,d2
    u32(bytes, 0x1e612800U);  // fadd d0,d0,d1
  }
  u32(bytes, 0xd65f03c0U);  // ret
  for (const auto& ref : refs) {
    const auto at = constant(bytes, ref.value);
    const auto displacement = static_cast<std::uint32_t>((at - ref.at) / 4);
    const std::uint32_t rt = ref.at == 4 ? 0 : 2;
    patch32(bytes, ref.at, 0x5c000000U | (displacement << 5) | rt);
  }
#endif
  const auto page = sysconf(_SC_PAGESIZE);
  if (page <= 0) { fallback_ = "Cannot query OS page size"; return; }
  code_bytes_ = ((bytes.size() + page - 1) / page) * page;
  code_ = mmap(nullptr, code_bytes_, PROT_READ | PROT_WRITE,
               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  if (code_ == MAP_FAILED) { code_ = nullptr; code_bytes_ = 0; fallback_ = "Writable mapping denied"; return; }
  std::memcpy(code_, bytes.data(), bytes.size());
  __builtin___clear_cache(static_cast<char*>(code_), static_cast<char*>(code_) + bytes.size());
  if (mprotect(code_, code_bytes_, PROT_READ | PROT_EXEC) != 0) {
    release(); fallback_ = "OS denied transition from writable to executable memory"; return;
  }
  // POSIX JIT ABI convention; no object/function pointer aliasing is used.
  static_assert(sizeof(function_) == sizeof(code_));
  std::memcpy(&function_, &code_, sizeof(function_));
#if defined(__x86_64__)
  backend_ = "native-x86_64";
#else
  backend_ = "native-aarch64";
#endif
  // Fail closed to the interpreter if arithmetic disagrees with the portable
  // reference. This checks the installed emitter; it is not a device benchmark.
  for (unsigned trial = 0; trial < 3; ++trial) {
    std::vector<double> probe(weights_.size());
    for (std::size_t i = 0; i < probe.size(); ++i)
      probe[i] = trial == 0 ? 0.0 : (trial == 1 ? 1.0 : (static_cast<double>(i) - 4.0) / 3.0);
    if (function_(probe.data()) != interpreted(probe)) {
      release();
      backend_ = "interpreter";
      fallback_ = "Native arithmetic self-check disagreed with reference";
      return;
    }
  }
#else
  fallback_ = "No native emitter for this OS/architecture";
#endif
}

}  // namespace edge_ai
