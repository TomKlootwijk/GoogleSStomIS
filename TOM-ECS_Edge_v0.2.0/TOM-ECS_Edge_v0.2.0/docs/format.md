# TOM-ECS/1 device envelope

Version 1.0, little endian. Extension: `.tecs`. Implementation: `ecs/bundle.cpp`;
authoring tool: `tools/tom_ecs.py`. This is a new bounded device envelope. It does
not replace TOMAGI 1.0, XD-ECS/11, or the source repositories' existing formats.

## Purpose and admission

A package binds a source manifest, capacity/work contract, initial entities,
component words, source epochs, ordered events, and admitted source data into
one reproducible byte string. Its root digest becomes the ECS contract digest.
Changing any package byte therefore changes the contract and resulting receipt.
Expected final-state hashes are kept in a sidecar so there is no circular hash.

Only operators compiled into the application can run. The TOMAGI section is
validated data interpreted by the pinned native TOMK runtime. A package cannot
introduce a new shared library, shell command, URL, C++ translation unit, or Wasm
module. The source metadata is not an executable instruction source.

SHA-256 detects modification relative to a known digest. It does not authenticate
an author. A malicious party can construct a different correctly hashed package;
the semantic validator and fixed operator boundary still apply.

## Header: 96 bytes

| Offset | Bytes | Meaning |
|---:|---:|---|
| 0 | 8 | ASCII `TOMECS1` followed by a zero byte |
| 8 | 2 | Major version, 1 |
| 10 | 2 | Minor version, 0 |
| 12 | 4 | Header bytes, 96 |
| 16 | 8 | Total file bytes, at most 16 MiB |
| 24 | 4 | Directory entry count |
| 28 | 4 | Directory entry size, 64 |
| 32 | 32 | Root SHA-256 of the complete file with these 32 bytes set to zero |
| 64 | 32 | Reserved, all zero |

The directory immediately follows. Entries have increasing unique type numbers;
data sections appear in the same order, aligned to eight bytes. All alignment
padding is zero. Overlaps, unexplained gaps, unknown types/flags, truncated data,
nonzero reserved fields, unsupported versions, and trailing bytes are rejected.

## Directory entry: 64 bytes

| Offset | Bytes | Meaning |
|---:|---:|---|
| 0 | 4 | Section type |
| 4 | 4 | Flags, zero |
| 8 | 8 | Absolute data offset |
| 16 | 8 | Section byte length |
| 24 | 4 | Record count |
| 28 | 4 | Record stride, or zero for an opaque blob |
| 32 | 32 | SHA-256 of the section bytes |

For fixed records, `count * stride` equals the byte length. For an opaque blob,
count is one. Empty record arrays are permitted; the required metadata is not
empty. Integers are decoded byte by byte; C++ struct padding is never serialized.

## Sections

| Type | Records | Requirement | Content |
|---:|---|---|---|
| 1 | Opaque | Required | Source metadata, 1 byte to 1 MiB |
| 2 | Config64 | Required | Capacities, final logical tick, capabilities and explicit work budget |
| 3 | Entity48 | Required | Dense initial entities, rule state and original TOMAGI initialization flag |
| 4 | Component16 | Required | Unique sorted component assignments |
| 5 | Event48 | Required | Strictly ordered event transcript |
| 6 | Source8 | Required | Source IDs and epochs |
| 7 | Opaque | Optional | Original TOMAGI Header128 + Cell48 bytecode |
| 8 | Opaque | Paired with 9 | Original 2,448-byte log-net-D Q16 bitplanes |
| 9 | Opaque | Paired with 8 | Original 153-byte validity mask |
| 10 | NativeBinding48 | Optional | Up to eight entities bound to compiled TNOMTOM source profiles |

The Python authoring tool writes section 1 as canonical UTF-8 JSON: sorted keys,
compact separators, integer numeric fields, no floats or NaN. The native loader
treats these bytes as opaque, untrusted metadata and checks their size and hash.
It does not parse them, authenticate source identity, or execute their content.
The Python inspector additionally checks canonical JSON; native binary validation
does not make that stronger metadata-format claim.

## Config64

Offsets 0, 4, 8, and 12 hold four `uint32`: entity capacity (1..1,024), component
count (16..64), event capacity (1..65,536), and source capacity (1..32). The entity
and component product is at most 65,536. The next four fields are `uint64`:
commit-through logical tick at 16, capability bits at 24, maximum event work at
32, and maximum abstract operations at 40. Bytes 48..63 are reserved and zero.

Known capabilities are mutation=1, rewrite=2, lifecycle=4, lookup=8, native model=16.
The budget caps are 65,536 events and 10,000,000 abstract operations per imported
transcript. Operation units are explicit deterministic accounting, **not CPU
cycles**. A hardware admission controller may choose a smaller budget before an
epoch and must record it as input. It must not silently change consensus state
based on a wall-clock race or a temperature reading taken halfway through replay.

## Entity48 and Rule32

Entity48 contains slot, generation, flags, reserved (`uint32` at 0,4,8,12), then a
Rule32 at 16. Initial slots are dense from zero and generation is one. Flag 1
initializes the entity's first 16 components from the original TOMAGI header;
the subsequent Component16 records may override words. Other flags are rejected.

Rule32 consists of four `uint64`: `act_addend`, `rewrite_xor`, `version`, and zero
reserved. Version starts at one. These fields belong to a small paired-transition
integration primitive, **not the full Maktub language or a replacement for its
source description state**.

For that primitive only, with old value `x`, old addend `a`, rewrite constant `r`
and event argument `u`:

```
x_next = (x + a + u) modulo 2^64
a_next = a XOR x XOR u XOR r
version_next = version + 1, checked
```

Both right-hand sides read the old snapshot. They commit together. The rewritten
addend affects the next event. The source-specific native profiles retain their
own larger state, types, byte layouts and transition functions.

## Component16 and Source8

Component16 is `slot:uint32`, `component:uint16`, `reserved:uint16=0`,
`value:uint64`. Entries are unique and sorted by `(slot,component)`. Signed source
words retain their two's-complement bit patterns; units and interpretation belong
to the source ABI, not to the unsigned storage container.

Source8 is `source_id:uint32`, `epoch:uint32`. Exactly one entry for each dense
source ID is required. Epochs prevent old sessions being mistaken for current
inputs. Epoch rotation in the C++ API is explicit and only valid at an empty
queue barrier; the import format supplies an initial epoch and a single transcript.

## Event48

| Offset | Bytes | Meaning |
|---:|---:|---|
| 0 | 8 | Logical tick |
| 8 | 4 | Source ID |
| 12 | 4 | Source epoch |
| 16 | 8 | Source sequence |
| 24 | 4 | Target entity slot |
| 28 | 4 | Target generation |
| 32 | 2 | Admitted opcode |
| 34 | 2 | Component index |
| 36 | 4 | Flags, zero |
| 40 | 8 | Argument |

Sort order is `(logical_tick, source_id, sequence)`. The C++ live queue sorts
arrivals before commit; a package already stores that canonical order. Events at
or below a closed frontier cannot be added later. Different packet arrival orders
therefore produce the same accepted epoch only when they contain the same admitted
events before the same explicit closure. Network timing alone cannot decide closure
deterministically across devices.

| Opcode | Operation | Exact rule |
|---:|---|---|
| 1 | Set64 | Set a component word |
| 2 | AddWrap64 | Addition modulo 2^64 |
| 3 | AddChecked64 | Reject unsigned overflow |
| 4 | Xor64 | Bitwise XOR |
| 5 | Copy64 | Argument is another component index on the same entity |
| 6 | PairActRewrite64 | Snapshot rule above |
| 7 | DestroyEntity | Advance generation; exhausted generations retire |
| 8 | SpawnEntity | Admit only the current unused generation |
| 9 | D6Lookup | Argument high 32 bits=row, low 32 bits=angle index; invalid source nodes remove component presence |
| 256 | TomagiStep | One step of the original source C runtime; component and argument must be zero |
| 512 | NativeProfileStep | One transactional step of the entity's pinned native TNOMTOM profile |

## NativeBinding48 and source-profile inputs

Each record contains `entity_slot:uint32`, `compiled_profile_index:uint32`, a
32-byte profile fingerprint, and `reserved:uint64=0`. Records have unique sorted
initial entity slots. The fingerprint is SHA-256 of these ASCII bytes, including
the final newline:

```
TNM-PROFILE/1\n
<profile id>\n
<original Wasm SHA-256 in lowercase hexadecimal>\n
<native recipe SHA-256 in lowercase hexadecimal>\n
<initialized full-memory SHA-256 in lowercase hexadecimal>\n
```

The notation `\n` here means one newline byte, not a backslash followed by `n`.
The compiled profile at the selected index must reproduce that fingerprint.
This prevents an index from accidentally selecting a different profile or boot
state, including two profiles that use the same kernel with different recipes.
Total bound linear memory is limited to 8 MiB; transactional rollback buffers and
other runtime structures add to the real memory footprint.

Opcode 512 with argument zero steps the retained source state without new port
input. Otherwise the argument must equal the profile's exact input byte count,
at most 512 bytes. Bytes come in little-endian order from present component words
starting at the event's component index. A final partial word uses only the needed
low bytes. Profiles with larger input ports support retained-input stepping here;
their larger typed inputs are available through the separate native module API.
No scalar-to-field, sensor-to-physics, or float-to-integer conversion is inferred.
The caller must supply the declared source type, unit and representation.

Native state belongs to the bound entity. Destruction of a bound entity is rejected
in this fixed profile so that the event loop never releases/reallocates module
storage or silently reuses it for a new generation. A future explicit constructor
transaction would require its own versioned state and replay contract.

Work-budget preflight covers the complete admitted batch before mutation. Once
admitted, each event has its own checked transition and receipt. An invalid event
can be rejected while other events in that batch commit. This is **not** the full
XD-ECS/11 `atomic_epoch` graph-construction transaction.

## Replay and checkpoint meaning

Canonical state includes capacities, contract digest, entity generations/presence,
all component words and rule fields, source epochs/sequences, closure frontier,
retained queue, module/LUT hashes, counters and the receipt chain. Bound native
profiles additionally retain their full linear-memory bytes, sequence, identity
and last native call receipt. SHA-256 covers
these bytes. The loader repeats the transcript in two fresh kernels and compares
the state hash. Host tests also compare source goldens and independently varied
arrival orders; merely repeating one buggy implementation is not semantic proof.

A digest is not a state snapshot. Keep initial data and event inputs to reproduce
state, or retain an authenticated complete snapshot with the precise profile and
kernel version. The native source-profile API exposes complete linear memory and
its sequence; restoring arbitrary memory does not prove that the state is reachable.

The format supports finite exact computation. It cannot provide zero execution
time, an infinite token window, exact prediction of future live inputs, or direct
control of hardware that Android does not expose.
