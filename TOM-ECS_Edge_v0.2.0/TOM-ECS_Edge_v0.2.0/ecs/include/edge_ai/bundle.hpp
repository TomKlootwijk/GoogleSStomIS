#pragma once

#include <cstdint>
#include <span>
#include <string>

namespace edge_ai::bundle {

// TOM-ECS/1 is a finite, versioned phone-profile envelope. It is not an alias
// for XD-ECS/11 or TOMAGI 1.0. Import allocates bounded storage; the ECS event
// loop does not. Imported sections are data, never newly downloaded code.
inline constexpr std::uint64_t kMaximumBytes = 16ULL * 1024 * 1024;

// Validates framing, limits, section SHA-256, root SHA-256, canonical padding,
// event ordering and source ABI, then replays in two fresh native kernels.
// All errors are reported as JSON; no Java exception crosses JNI.
std::string inspect_and_replay_json(std::span<const std::uint8_t> bytes);

}  // namespace edge_ai::bundle
