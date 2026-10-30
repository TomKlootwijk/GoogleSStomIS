#pragma once

#include <array>
#include <cstddef>
#include <cstdint>
#include <memory>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace edge_ai { class HexLut; }

namespace edge_ai::ecs {

using Digest = std::array<std::uint8_t,32>;
Digest sha256(std::span<const std::uint8_t> bytes);
std::string hex_digest(const Digest& digest);

struct EntityId {
  std::uint32_t slot = 0;
  std::uint32_t generation = 1;
  bool operator==(const EntityId&) const = default;
};
enum class Opcode : std::uint16_t {
  Set64 = 1, AddWrap64 = 2, AddChecked64 = 3, Xor64 = 4,
  Copy64 = 5, PairActRewrite64 = 6, DestroyEntity = 7,
  SpawnEntity = 8, D6Lookup = 9, TomagiStep = 0x0100,
  NativeProfileStep = 0x0200
};
// Exactly these fields are serialized individually. Never memcpy this struct
// into a package: native padding is not part of the portable 48-byte ABI.
struct Event {
  std::uint64_t logical_tick = 0;
  std::uint32_t source_id = 0;
  std::uint32_t source_epoch = 0;
  std::uint64_t sequence = 0;
  EntityId target;
  Opcode opcode = Opcode::Set64;
  std::uint16_t component = 0;
  std::uint32_t flags = 0;
  std::uint64_t argument = 0;
  bool operator==(const Event&) const = default;
};
// This tiny paired-transition primitive tests source-specified Act/Rewrite
// publication timing. It is not a replacement for the complete Maktub program.
struct Rule {
  std::uint64_t act_addend = 0;
  std::uint64_t rewrite_xor = 0;
  std::uint64_t version = 1;
  std::uint64_t reserved = 0;
  bool operator==(const Rule&) const = default;
};
enum class Status : std::uint16_t {
  Ok = 0, Duplicate, ConflictingDuplicate, LateEvent, SourceEpochMismatch,
  InvalidEvent, QueueFull, StaleEntity, MissingComponent, Overflow,
  CapabilityDenied, WorkBudgetExceeded, ModuleUnavailable, ReplaySequence,
  InvalidFrontier, SetupClosed, EntityCapacity, ModuleFailure
};
const char* status_name(Status status);

enum Capability : std::uint64_t {
  Mutate = 1ULL << 0, Rewrite = 1ULL << 1, Lifecycle = 1ULL << 2,
  Lookup = 1ULL << 3, NativeModel = 1ULL << 4,
  AllLocal = Mutate | Rewrite | Lifecycle | Lookup | NativeModel
};
struct Capabilities { std::uint64_t allowed = AllLocal; };
struct WorkBudget {
  std::uint64_t max_events = 1024;
  std::uint64_t max_operations = 1000000;
};
struct Config {
  std::uint32_t entity_capacity = 64;
  std::uint32_t component_count = 16;
  std::uint32_t event_capacity = 1024;
  std::uint32_t source_capacity = 8;
  Digest contract_digest{};
};
struct CommitReport {
  Status status = Status::Ok;
  std::uint64_t processed = 0;
  std::uint64_t applied = 0;
  std::uint64_t rejected = 0;
  std::uint64_t operations = 0;
  std::array<std::uint64_t,18> by_status{};
};
struct NativeProfileState {
  EntityId entity;
  std::string profile_id;
  std::string memory_sha256;
  std::uint64_t sequence = 0;
  std::int32_t last_status = 0;
  std::uint32_t last_trap = 0;
};

// Bounded TOM-ECS/1 native adapter. This is not full XD-ECS/11 compatibility.
// No network, wall clock, floating arithmetic, uploaded native code or per-event
// allocation occurs in commit_through. One caller owns a Kernel at a time.
class Kernel {
 public:
  explicit Kernel(Config config = {});
  ~Kernel();
  Kernel(const Kernel&) = delete;
  Kernel& operator=(const Kernel&) = delete;
  Kernel(Kernel&&) noexcept;
  Kernel& operator=(Kernel&&) noexcept;

  EntityId create_entity();
  void initialize_entity(EntityId entity);
  void set_component(EntityId entity, std::uint16_t component, std::uint64_t value);
  void set_rule(EntityId entity, Rule rule);
  void set_source_epoch(std::uint32_t source, std::uint32_t epoch);
  void attach_lut(const edge_ai::HexLut& lut);
  // Parses bounded original TOMAGI 1.0 bytes; executes the unmodified pinned C
  // module. Original Cell48 and State64 meanings are preserved.
  void attach_tomagi(std::span<const std::uint8_t> tmg_bytes);
  void initialize_tomagi_entity(EntityId entity);
  // Bind one of the compiled, pinned source profiles. No new native code is
  // accepted. At most8 bindings and8MiB total authoritative linear memory.
  void attach_native_profile(EntityId entity, const std::string& profile_id);
  std::vector<NativeProfileState> native_profile_states() const;

  Status enqueue(const Event& event);
  CommitReport commit_through(std::uint64_t tick,
      Capabilities capabilities = {}, WorkBudget budget = {});
  // Source epochs change only at an explicit empty-queue barrier. Include this
  // control in a replay transcript; it is never inferred from a live packet.
  Status rotate_source_epoch(std::uint32_t source, std::uint32_t next_epoch);

  bool alive(EntityId entity) const;
  std::optional<EntityId> current_entity(std::uint32_t slot) const;
  bool has_component(EntityId entity, std::uint16_t component) const;
  std::uint64_t component(EntityId entity, std::uint16_t component) const;
  Rule rule(EntityId entity) const;
  std::size_t queued() const;
  bool has_frontier() const;
  std::uint64_t frontier() const;
  std::vector<std::uint8_t> canonical_state() const;
  Digest state_sha256() const;
  const Config& config() const;

 private:
  struct Impl;
  std::unique_ptr<Impl> impl_;
};

// Deterministic generated integration fixture, not source-model benchmarking.
std::string run_fixture_json(std::uint64_t seed = 1);

}  // namespace edge_ai::ecs
