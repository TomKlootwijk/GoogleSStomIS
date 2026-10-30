# XD retained-state controller profile 1

This implements the proposed finite realization's generic transaction envelope. It does not implement every native XD geometry/physics operator or all six contained models. Native CRDT events are not reinterpreted as this transport queue. No physical apparatus is asserted.

The production module uses one non-shared memory, min=max16 WebAssembly pages (1 MiB), no imports, integer instructions and no mutable globals. Exported memory ownership is part of the admitted API: the loader writes only ingress and snapshot input buffers; arbitrary writes to committed/control/sealed memory are outside this API. This is an exact transition interface, not a security/attestation boundary against its owner.

| Region | Absolute byte offset | Length |
|---|---:|---:|
| Control | 256 | 256 |
| Committed bank | 4096 | 65536 |
| Candidate bank | 73728 | 65536 |
| Exact sealed candidate | 143360 | 65536 |
| Snapshot transfer buffer | 262144 | 196864 |
| Ingress bytes | 524288 | 4096 |

Snapshot bytes are control, committed, candidate, sealed in that order. These are every retained execution-state byte; other memory is noncausal transfer/reserved space, and restore canonicalizes it. No export suspends a WebAssembly stack: snapshots are between API calls.

Each bank has: magic u32 `0x314c4458` at0; ABI1 u32 at4; epoch u64 at8; allowed kernel mask u32 at16 (initial3); writable section mask u32 at20 (initial255); queue count u32 at24; outbox count u32 at28; next input ID u64 at32 (initial1). Section lengths are8 u32 values at64. All integers are little-endian. S8 sections E,H,P,xi,b,F,O,C each have4096bytes at `256+4096*index`. E/H/P/xi are retained typed module payloads; this controller does not pretend to evaluate their unsupported source operators.

Dispatch has16 records of32bytes at bank33024. Each record is8 u32 words: kind, code offset within O, code bytes, input bits, output bits, generation, input bit offset within b, output byte offset within F. Kind0 is an empty slot/tombstone: its fields except generation and all route bytes are zero. Generations therefore survive deletion and cannot be silently reused. Nonempty generations start at1. Changed records must increment the old generation exactly once; identical records retain it. Overflow is an explicit error.

Kinds currently admitted:1 original six-vertex parity (120code bytes: LUT06 +119native packed ROM; input72bits; output15bits; F output slot needs31bytes, Q at0 and retained117bits at16);2 original Maktub mirror (one code byte01, table indexed by b; input2 coincident state/description bits; output2 bits; both next bits are1-oldbit). Parity and mirror read committed code/dispatch/b, write candidate F and, for mirror, candidate b. The old mirror pair must agree. Other kinds are unsupported rather than replaced with a generic claimed source operation.

C contains16 routing records of8bytes: input section u16=4, output section u16=5, flags u32=1 for parity or3 for mirror. Each active route must match dispatch; empty routes are zero. Initial O contains parity code at0 and mirror at120; b has9zero bytes; F has33zero bytes; C has128bytes with two routes; slots0/1 are parity/mirror generation1. Other S8 payloads initially have length0 and remain explicit.

Queue16×64B begins at33536; outbox16×64B at34560. Queue record: ID u64@0, kind u32@8 (0 patch/control,1 invoke), payload length u32@12 (0or4), payload at16 (invoke slot u32). IDs are strictly sequential from1; earlier IDs return STALE without re-execution, gaps return BAD_INPUT. No deduplication by equal payload. Exhausted counters do not wrap. Native source tags and canonical merge, if supplied as typed module data, retain their native semantics separately.

Outbox record: ID u64@0, transport kind u32@8, receipt status u32@12, committed epoch u64@16, executed source kind u32@24, source generation u32@28, result32bytes@32. Source outputs and trace bits fit in the result area. These are digital result receipts, not physical actuation evidence. Explicit `ack_outbox` consumes only the matching head receipt.

Control relative to256: phase u32@0 (0idle,1staged,2validated); status u32@4; event ID u64@8; base epoch u64@16; ran u32@28; executed source kind u32@32; generation u32@36; selected slot u32@40. Remaining control bytes are reservedzero. Status:0reset;1success;2badphase;3badinput;4capacity;5badstate;6policy;7changedcandidate;8stale;9domain. In IDLE all control bytes except status are zero. A reserved invoke receipt has status0 until run completes; committed receipts never have status0.

Exports:

- `reset()`: clears the entire memory and creates canonical initial banks/profile.
- `enqueue(id:i64,kind:i32,len:i32)->i32`: idle only; reserve queue capacity and validate ID/kind/length before accepting ingress. The source-valid runtime receives no added rejection dynamics.
- `begin()->i32`: idle, nonemptyqueue, freeoutbox and nonexhaustedepoch required. Copy committed to candidate, consume candidate head, reserve one candidate receipt, set candidate epoch=base+1, phase=staged. Current state remains unchanged.
- `stage_patch(section,offset,len)->i32`: staged only; checked against CURRENT writable mask and4096capacity; copy ingress, extend section length. Explicit proposed data/code writes. After run, b/F patches are rejected; source results stay bound to that invocation. Future code/description changes remain stageable.
- `stage_length(section,len)->i32`: same phase/permission rules; zero bytes removed or newly exposed and set length.
- `stage_dispatch(slot)->i32`: staged only; copy32 ingress bytes to candidate descriptor. Its admitted generation/code/type/routes are checked by validate.
- `stage_policy(kernel_mask,section_mask)->i32`: staged only; candidate policy may restrict the current supported policy, not authorize new capabilities.
- `run_candidate(slot)->i32`: staged, queued invoke slot matches, not already run; execute the committed native kernel and retain old kind/generation in receipt. Staged future dispatch does not alter it.
- `validate()->i32`: staged; full structural and transaction checks under CURRENT policy; invoke must have run; recompute its source result from current code/data and verify candidate result and receipt; copy candidate into sealed bank and set validated phase.
- `commit()->i32`: validated; revalidate, check base epoch and exact65536-byte equality to sealed candidate; atomic publication at the API boundary. No hash-collision shortcut. Clear pending banks/control.
- `abort()->i32`: discard pending candidate/seal/control; retain current queue/code/application state.
- `reject_head(reason)->i32`: idle only; reserve receipt first; remove unsupported/invalid head and issue explicit fault receipt while preserving application/code. This is transport admission handling, not a source physics transition.
- `ack_outbox(id:i64)->i32`: idle/matchinghead/nonexhaustedepoch; remove head receipt and increment epoch.
- `snapshot()->i32`, `restore()->i32`: copy all execution-state bytes; restore first validates magic/capacities/source descriptors, policy, phase/epoch/head/invocation coherence, zero/identical seal as appropriate. A failed restore leaves execution state unchanged.

Space exhaustion returns capacity before acknowledgment/mutation. Full queues/outboxes persist. The status register records the most recent failure; it is finite. Deasserted digital readiness does not stop physical time. API call sequences and their ingress bytes are explicit inputs and must be retained in external execution evidence to replay a run from its initial snapshot.
