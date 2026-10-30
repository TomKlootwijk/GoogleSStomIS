# JTK / TK exact computational data through bit LUTs

`twin.wasm` is a new14,452-byte backend for both contained Twin roles under XD-TAU.
It preserves the frozen `software/twin_exact` mathematical profiles, cell format,
finite capacities, phase chronology, source operation order, clock distinctions
and exact formal expression views. Original files and the v2 composition layer
remain unchanged. This profile does not alias the native Python binary64 programs.

The actual rational, phase, clock-coefficient, metric, compaction and energy-operand
word arithmetic now executes compositions of the frozen Boolean LUT helpers,
including general exact division/remainder/GCD. The linker replaces116 source
numeric expressions and explicitly replaces the pure GCD and product-fit predicates
by equivalent LUT implementations. All remaining native numeric instructions have
exact AST paths and declared control/address/index/encoded-transport roles.

The module remains one fixed nonshared64KiB memory, import-free, without globals or
hidden segments. Its only i64 instructions are const/load/store for packed words;
there is no native i64 arithmetic, division, comparison or cast. Native i32 loops,
addresses, packing, identity/admission and algorithm-width selection remain. Three
native `i32.rem_u` instructions normalize frozen shift/rotate counts. They are
explicit index operations, not a hidden numeric profile-division implementation.
This is computational DATA lowering, not a whole one-bit CPU or physical hardware.

The claim covers the actual numeric WASM operators. The retained exact AST schema
and host decoder remain a separately bound presentation/transport layer; their
symbolic expression assembly and rendering are not claimed as completed bit-LUT
lowering. Constants and selection/copy of already represented words also remain
explicit transport operations.

## Retained state and faults

The old active buffers end24576. The new private workspace is60000..61023. It
contains packed helper operands/results, bit carries, division state and the exact
truth/ABI bank at60128..60139. All64KiB bytes, immutable module identity and the
retained exact expression schema accompany a snapshot. No memoized phase or hash
shortcut replaces source chronological replay.

Every original status-bearing API returns unique status6 on an altered LUT/code
bank **before any write**, including status/candidate bytes. Original void/value
queries trap; dedicated `lut_code_valid()` and `lut_workspace_offset()` remain
read-only introspection. Fresh immutable boot initializes truth/identity. Exported
`reset()` checks first and cannot repair corrupted code. A valid reset reproduces
all original bytes outside the private range and canonical private initialization.

Source domains and original statuses0..5 are unchanged when code is valid. The
new source-initialized resources have distinct IDs:

| Role | ID | Step | Exact projection |
|---|---|---|---|
| JTK | `jtk.slog2.quarterturn.data-bit-lut-v1` | `jtk_advance()` | Cartesian rational3,48bytes at256 [m] |
| TK | `tk.selected-quarterturn.data-bit-lut-v1` | `tk_step()` | q,r rational pair,32bytes at8448 [1] |

Each has its own `*_native_recipe.json` and `*_default_memory.bin`. Outside private
workspace the image exactly matches its frozen word-profile initializer. Source
logarithm, square-root and arctangent values remain exact formal descriptors defined
by the same retained schema/codec; a finite decimal is never substituted. Source
coordinate, conformal, logarithmic, allocation and flat-proper clocks keep separate
meanings. The logical scheduler is not a calibrated apparatus clock.

## Exact helper scheduling

The multiplication wrapper obtains signed magnitudes through LUT comparisons and
subtraction, chooses n=min64,bitlength(A)+bitlength(B) with zero→1, calls the original
width-parametric LUT multiply, then restores sign through LUT XOR/subtraction. The
chosen width retains the entire magnitude product or its exact low64 bits. Signed
MIN is an unsigned magnitude word; no native abs overflow is relied upon.

Unsigned division/GCD choose the maximum operand bitlength, at least1. Both operands
fit that exact width. Signed division retains64 bits; division by1 uses the frozen
identity-LUT OR(A,0). The exact source product-fit predicate uses zero/unit identities
and otherwise its original floor(WORK/abs(b)) comparison. These transformations
change helper work, not a source arithmetic order, domain guard or phase law.

## Evidence

The complete original4,728 exact source checks run through both actual backends.
Their statuses and1,837 whole-memory comparisons outside the private range agree,
including two256-step quarter-turn runs, nontrivial a1/2 and2 at their unchanged
12-step capacity limit, normalization, geometry, domain and error paths. The original
201 portable vectors additionally retain their original status and whole-word-memory
hash oracles. Twenty-two disk-reopened full snapshots continue identically.

Independent integer probes cover733 operand pairs and11,728 calls to the same
production helper bodies: every16×16 boundary combination, signedMIN, unsigned high
bits, random64-bit cases, truncation/remainder, comparisons and product-fit. The
test-only module merely adds exports; every production function AST is identical.
Code-fault checks flip all96 retained truth/identity bits across all16 original
interfaces:1,536 calls preserve all memory and reject in the declared lane.

Node/V8 replays every1,730 source-corpus call, all201 original portable calls, all
11,728 primitive probes and all1,536 faults. It compares the complete new64KiB
memory after every source/primitive call, not merely a projection. Wasmtime and
Node validation are separate from the strict actual binary decoder and AST inventory.
[results/dataflow_audit.json](results/dataflow_audit.json) records actual binary/AST
count agreement, unchanged linked helper bodies and the exact wrapper identities.

Finite execution evidence and the stated algebraic identities support this profile.
No universal physical/spacetime theorem, exact real evaluation of the old float
programs, complete hardware realization or sensor/actuator calibration is inferred.

Reproduce with Python/Wasmtime and Node:

```text
python software/twin_bit_exact/linker.py
python software/twin_bit_exact/build_and_test.py
python software/twin_bit_exact/primitive_probes.py
python software/twin_bit_exact/fault_tests.py
python software/twin_bit_exact/frozen_vectors.py
python software/twin_bit_exact/make_recipes.py
node software/twin_bit_exact/cross_runtime.mjs
python software/twin_bit_exact/audit.py
python software/twin_bit_exact/package.py
```
