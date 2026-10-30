#pragma once

#include <cstdint>
#include <memory>
#include <string>

namespace edge_ai::ecs {

// A retained, single-owner foreground session. The frontend supplies capture
// cadence and explicit observations; this class never reads a clock or sensor.
// A new instance is the only reset operation. Calls require external locking.
class LiveSession {
 public:
  LiveSession();
  ~LiveSession();
  LiveSession(const LiveSession&) = delete;
  LiveSession& operator=(const LiveSession&) = delete;
  LiveSession(LiveSession&&) noexcept;
  LiveSession& operator=(LiveSession&&) noexcept;

  // Acceleration is an explicitly recorded signed integer in micro(m/s^2),
  // never micro-g. Invalid observations remain recorded with accel_valid=false.
  // Thermal codes0..6 follow the supplied Android observation. Native steps
  // are admitted at0..2 with at least256MiB reported available memory. Telemetry
  // still commits when model execution is skipped. Input values are never
  // coerced into a model's force/rational/quantum input quantities.
  std::string observe_json(std::uint64_t available_memory,
      std::int64_t accel_micro_ms2, bool accel_valid,
      std::uint32_t thermal_status);

  std::uint64_t epoch() const noexcept;

 private:
  struct Impl;
  std::unique_ptr<Impl> impl_;
};

} // namespace edge_ai::ecs
