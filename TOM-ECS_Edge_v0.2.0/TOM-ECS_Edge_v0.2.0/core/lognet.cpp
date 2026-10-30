#include "edge_ai/core.hpp"

#include <algorithm>
#include <cmath>
#include <fstream>
#include <stdexcept>

namespace edge_ai {
namespace {
void check(D6 x) {
  if (x.rotation >= 6) throw std::invalid_argument("D6 rotation outside 0..5");
}
std::uint64_t modulo(std::int64_t x, std::int64_t modulus) {
  auto out = x % modulus;
  if (out < 0) out += modulus;
  return static_cast<std::uint64_t>(out);
}
std::vector<std::uint8_t> read_exact(const std::string& path, std::size_t expected) {
  std::ifstream in(path, std::ios::binary | std::ios::ate);
  if (!in || in.tellg() != static_cast<std::streamoff>(expected))
    throw std::runtime_error("Source LUT file missing or wrong size: " + path);
  in.seekg(0);
  std::vector<std::uint8_t> out(expected);
  if (!in.read(reinterpret_cast<char*>(out.data()), out.size()))
    throw std::runtime_error("Cannot read source LUT: " + path);
  return out;
}
bool bit(std::span<const std::uint8_t> bytes, std::size_t at) {
  return ((bytes[at / 8] >> (7 - at % 8)) & 1) != 0;
}
}  // namespace

std::uint64_t apply_angle(std::uint64_t theta, D6 x) {
  check(x);
  if (theta >= static_cast<std::uint64_t>(kTurnTicks))
    throw std::invalid_argument("Angle is not canonical nanodegrees");
  const auto signed_theta = static_cast<std::int64_t>(theta);
  return modulo((x.reflection ? -signed_theta : signed_theta) +
                    static_cast<std::int64_t>(x.rotation) * (kTurnTicks / 6),
                kTurnTicks);
}
D6 compose(D6 left, D6 right) {
  check(left); check(right);
  return {static_cast<unsigned>(modulo(static_cast<std::int64_t>(left.rotation) +
          (left.reflection ? -static_cast<std::int64_t>(right.rotation) :
                              static_cast<std::int64_t>(right.rotation)), 6)),
          left.reflection != right.reflection};
}
D6 inverse(D6 x) {
  check(x);
  return {static_cast<unsigned>(modulo(x.reflection ? x.rotation :
                 -static_cast<std::int64_t>(x.rotation), 6)), x.reflection};
}
unsigned transform_angle72(unsigned angle, D6 x) {
  check(x);
  if (angle >= 72) throw std::invalid_argument("Angle index outside 0..71");
  return static_cast<unsigned>(modulo((x.reflection ? -static_cast<std::int64_t>(angle) : angle) +
                          12 * static_cast<std::int64_t>(x.rotation), 72));
}
unsigned canonical_angle72(unsigned angle) {
  if (angle >= 72) throw std::invalid_argument("Angle index outside 0..71");
  unsigned minimum = angle;
  for (unsigned k = 0; k < 6; ++k)
    for (bool b : {false, true}) minimum = std::min(minimum, transform_angle72(angle, {k,b}));
  return minimum;
}
std::uint64_t exact_log2_level(unsigned code) {
  if (code >= 64) throw std::invalid_argument("Exact logarithmic code outside 0..63");
  return (std::uint64_t{1} << code) - 1;
}
HexLut HexLut::load(const std::string& planes_file, const std::string& mask_file) {
  return decode(read_exact(planes_file, 2448), read_exact(mask_file, 153));
}
HexLut HexLut::decode(std::span<const std::uint8_t> planes,
                      std::span<const std::uint8_t> mask) {
  if (planes.size() != 2448 || mask.size() != 153)
    throw std::invalid_argument("Expected 2448-byte planes and 153-byte mask");
  HexLut lut;
  lut.samples_.resize(17 * 72);
  for (std::size_t i = 0; i < lut.samples_.size(); ++i) {
    auto& sample = lut.samples_[i];
    sample.valid = bit(mask, i);
    for (unsigned p = 0; p < 16; ++p)
      sample.q16 |= static_cast<std::uint16_t>(bit(planes, p * 1224 + i)) << (15 - p);
    if (!sample.valid && sample.q16 != 0)
      throw std::invalid_argument("Invalid LUT node has a nonzero payload");
    lut.valid_count_ += sample.valid;
  }
  lut.invariant_ = true;
  for (unsigned row = 0; row < 17; ++row)
    for (unsigned angle = 0; angle < 72; ++angle)
      for (unsigned k = 0; k < 6; ++k)
        for (bool b : {false, true})
          if (lut.at(row,angle) != lut.at(row,transform_angle72(angle,{k,b})))
            lut.invariant_ = false;
  return lut;
}
LutSample HexLut::at(unsigned row, unsigned angle) const {
  if (row >= 17 || angle >= 72) throw std::out_of_range("LUT grid index out of bounds");
  return samples_.at(row * 72 + angle);
}
LutSample HexLut::canonical_sample(unsigned row, unsigned angle) const {
  if (!invariant_) throw std::logic_error("D6 equivalence has not been verified for this LUT");
  return at(row,canonical_angle72(angle));
}
double HexLut::normalized_signal_approx(std::uint16_t q16) {
  return std::expm1(std::log(16.0) * static_cast<double>(q16) / 65535.0);
}
}  // namespace edge_ai
