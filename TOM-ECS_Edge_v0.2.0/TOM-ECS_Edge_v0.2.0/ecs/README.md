# TOM-ECS/1 native execution contract

This is a bounded native adapter for the phone project. It preserves the
attached log-net-D sample table and original selected source-model ABIs. It is
not a replacement implementation of the complete TNOMTOM XD-ECS/11 language,
its 23-profile registry, route graph, constructor history or `atomic_epoch`.

## Authority and determinism

An entity is `(slot, generation)`. Components use component-major arrays of
unsigned 64-bit words and independent presence bits. Destroying an entity
increments its generation; an exhausted generation retires the slot. A stale
handle cannot address a replacement entity.

Initial setup closes after the first accepted enqueue or commit. Setup is
explicit: capacities, source epochs, entities, components, paired-rule words,
LUT data, original TOMAGI program and compiled source-profile bindings.

The caller records inputs, then publishes a completeness frontier. Pending
events at or below that frontier execute in ascending
`(logical_tick, source_id, sequence)` order. Each Event48 is one transaction;
events with equal logical ticks still execute sequentially in this order.
This is different from the complete source language's multi-actor atomic epoch.
An event at or below an already published frontier is late and cannot change
published state. Sequences must increase within each source epoch. A source
epoch rotates only at an explicit empty-queue barrier, which must appear in
the surrounding replay transcript.

Identical pending duplicates execute once. Conflicting duplicates reject the
whole identity; a canonical representative produces an arrival-independent
rejection receipt. Queue overflow rejects admission without overwriting older
records. Deterministic replay assumes the same admitted input log and recorded
barriers; packets lost before admission are not reconstructed.

Every admitted transition uses an immutable local pre-event component/rule
snapshot. Results commit after validation. Unsigned addition explicitly wraps
modulo 2^64; the checked-add opcode rejects overflow. Rule revisions use checked
increments. No floating arithmetic, wall clock, network access or downloaded
native code participates in the ECS transition.

The optional retained source modules have separately named numeric domains.
TOMAGI theta/time/phi use 2^18, 2^14 and 2^12 states. They are not the log-net-D
nanodegree coordinate fields. The source's `JIT1` opcode is a deterministic
hash/parity update, not a machine-code compiler. The earlier project's arithmetic
machine-code JIT remains a separate subsystem outside this integer-state claim.

## Native operator table

| Code | Operator | Contract |
|---:|---|---|
| 1 | Set64 | Set a value and its presence bit. |
| 2 | AddWrap64 | Add modulo 2^64. |
| 3 | AddChecked64 | Reject addition overflow without a partial component update. |
| 4 | Xor64 | Bitwise XOR. |
| 5 | Copy64 | Copy an existing component selected by `argument`. |
| 6 | PairActRewrite64 | Small integration primitive described below. |
| 7 | DestroyEntity | Clear and advance generation; bound native instances require a separate lifecycle protocol and cannot be destroyed by this opcode. |
| 8 | SpawnEntity | Activate a vacant, non-retired slot with the expected generation. |
| 9 | D6Lookup | Decode `argument=(row<<32)|angle`; look up only the verified source D6 orbit. Invalid source nodes clear component presence. |
| 256 | TomagiStep | Execute the unchanged pinned TOMK C runtime on all 16 original State64 words. |
| 512 | NativeProfileStep | Execute a compiled, pinned XD-KERNEL-RECIPE/1 profile, with original byte-port types and complete source memory. |

The paired integration primitive is deliberately small and separately named:

```
x_next = (x_old + rule_old.act_addend + argument) mod 2^64
addend_next = rule_old.act_addend XOR x_old XOR argument XOR rule_old.rewrite_xor
version_next = version_old + 1        # checked
```

Both calculations use the old state. The new rule becomes visible to the next
event. This tests TOM-MAKTUBIII's paired-publication timing; it does not pretend
to implement that complete source model. The separate pinned native QIS2
profile executes its actual source operators.

## Original model modules

`vendor/tomk/tomagi.c` and `.h` are unchanged files from
`c0mbatduckzz/TOMK` revision
`0febbaa1ea0df9a80eea6d7e45f75b652d39fa84`, retained with their MIT license.
The wrapper bounds and validates original Header128/Cell48/State64 files.
Fresh initialization uses the program's entry field, as original Python
`run(program, state=None)` does. Explicit component overrides can restore a
different current cell. Only the original `tomagi_step` arithmetic is called
during a transition; its file loader and printer are not used.

The sibling `native_modules` target compiles eight pinned original Wasm
profiles ahead of time. A kernel binds at most eight instances and at most
8 MiB of authoritative linear memory. Each instance also has a preallocated
rollback area; these limits do not describe total process RSS. Selected
original profiles contain no mutable globals, tables or data segments outside
their recorded linear memory. Full linear memory, sequence, profile identity,
source revision and Wasm/recipe/bootstrap hashes are included in canonical ECS
state. Source failures retain their status/trap/call receipts and restore all
source memory before returning.

For opcode 512, `argument=0` and `component=0` retain the profile's existing
input. Otherwise `argument` must equal the profile's exact input byte count,
at most 512. Those bytes are transported little-endian from present consecutive
component words starting at `component`. The kernel never invents a conversion
from accelerometer or other phone values into a rational, geometric or quantum
input. The 2,064-byte BigRat8192 input exceeds this particular event transport;
its retained default-input steps are supported. Its full source API remains
available in the native-module layer.

## Budgets, receipts and serialization

The queue and arrays allocate before the event loop. Commit preflight checks
the complete proposed batch against event count and abstract work budgets.
An insufficient budget leaves components, model memory, queue and frontier
unchanged. Work units are explicit accounting weights, not CPU instructions,
clock cycles, milliseconds or a hard real-time guarantee.

Each plain event costs `2*component_count+16`; D6 adds 12; TOMAGI adds
`96+bit_width(cell_count)`; a compiled profile adds
`128+linear_memory_bytes/64`. Capabilities separately gate mutation, rewriting,
lifecycle, lookup and model execution. These are kernel capabilities, not
substitutes for Android's operating-system permissions.

`canonical_state()` emits individual fixed-width little-endian fields, never
native C++ struct padding. It includes capacities, contract identity, immutable
module identities, complete component state, complete native authority, source
epochs/cursors, pending events in canonical order, and receipt-chain state.
`state_sha256()` hashes those bytes. Serialization can allocate; it is an
explicit observation outside the allocation-free event loop.

SHA-256 identifies exact bytes and detects changes. It does not establish
ownership, physical truth, reachable history or permission to act. The kernel
does not implement full historical snapshots from XD-ECS/11; the caller must
retain the event log and any complete snapshots required by its storage policy.

## Retained foreground session

`LiveSession` owns one telemetry entity and eight original native profile
instances across calls. `observe_json(memory_bytes, accel_micro_ms2, valid,
thermal_status)` commits a new explicitly numbered logical epoch. It records
four typed telemetry words and, when admitted, advances every retained model
once using its existing source input. It does not construct fresh models for
each observation. A new `LiveSession` is an explicit reset.

The acceleration unit is micro(m/s^2), represented as a signed 64-bit integer;
it is not micro-g. The boolean validity flag remains separate. Telemetry never
becomes an implicit force, rational vector or quantum input. Source clocks and
input/output units remain attached to each reported profile.

The session's declared admission policy permits model stages when reported
available memory is at least256MiB and supplied Android thermal status is0..2.
Severe or unknown thermal status, or lower available memory, skips model stages
while still recording telemetry and the logical epoch. This headroom threshold
is a conservative explicit policy, not a measured process working-set claim.
An individual source rejection or clock limit leaves that model's state intact
and is reported through its source status, trap code and sequence.

Each returned JSON record includes the supplied observation, the policy and
admission decision, event counts, full ECS state digest and native profile
memory digests. Feeding those observation records in order to a new session
reproduces the same transitions. Acquisition skipped by the frontend is a
separate acquisition decision and should be recorded by that frontend.

The core reads no clock, network or sensor. Android owns foreground cadence,
permission checks, backpressure, start/reset/stop controls and record retention.
The logical model epoch is not a claim that each mathematical source step
represents one second of physical time.
