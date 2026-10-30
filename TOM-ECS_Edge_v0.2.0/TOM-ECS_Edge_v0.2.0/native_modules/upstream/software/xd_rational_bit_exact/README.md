# XD original large-rational physics: DATA bit-LUT profile

This version executes the original XD-TAU v1.5 exact discrete oscillator, heat-pair, energy and coupled numeric replay in integer-only, no-import WebAssembly. It preserves the source-derived137-node coupled operator DAG (and separate38/30/17-node oscillator/heat/energy DAGs) and8192-bit canonical-rational ABI. The original geometry/event/CRDT program remains the explicitly external source of materialized parameters, sampled geometry count0..9 and graph parity0..1. XD remains the parent.

Mathematical limb add/subtract/product, GCD/division decisions, signed comparisons, zero/sign decisions and tick increments use actual Boolean truth-table lookups. Register helpers pack bits after lookup; they do not substitute native word arithmetic. Tables are XOR0x6, AND0x8, OR0xE, NOT0x1, sum0x96, carry0xE8, identity0x2 and XNOR0x9. They are retained and checked before numerical exports. New fault6 precedes application/tick/scratch work; status@0 may change. Reset explicitly rebuilds the original canonical zero cells and private bank.

## Scope and ABI

External canonical numerator/denominator capacities remain8192bits each and BigScratch intermediates16400bits. There is no precision or test-step reduction. Memory is fixed16pages/1MiB, with no imports, floats, mutable globals, tables or data segments. Full memory, including noncausal scratch, is retained replay state. Public functions and offsets match the frozen word ABI; `ABI.md` adds private bank/fault details.

Model time is exact rational declared-model time, h=1/5 in the recipe. The discrete midpoint and backward-Euler algorithms are exact as those algorithms. This is not an exact continuum solution, apparatus calibration, hardware-timing claim or whole1bitCPU theorem. Explicit native admission, control/index/address and encoded-bit/limb transport remain. `dataflow_inventory.json` lists every native numeric AST occurrence; mathematical ordering/zero decisions using limb lengths were specifically lowered.

## Source reuse and exact optimization bounds

`linker.py` pins the frozen numeric WAT, Boolean library, general1..64-bit division fragment and generic parser. It replaces math operators with LUT calls while preserving the source oscillator/heat/energy/coupled DAG. Memory relocation affects only library memory address operands, never arbitrary mathematical constants.

Redundant inner Boolean-library admission is removed only for closed, bounded callers behind the public bank guard; the mathematical LUT/carry nodes are unchanged. Register helpers use the same retained tables and bit order. Typed16/17-bit widths follow source bounds: limb<=65535; limb+limb+carry<=131071; incoming subtract operand<=65536. Limb product plus accumulator plus carry<=2^32-1. u16*u16 multiplication omits only upper16 multiplier rows proved zero by source digit typing.

Small BigGCD inputs use actual LUT GCD32. A one-limb divisor uses actual LUT divide32 on the transported `(remainder,digit)` pair. These preserve canonical application state and source errors, but may change noncausal BigScratch20..22 compared with the word module. No old-outside-private fullmemory equality is claimed after execution. New complete1MiB is compared across engines; all64 application cells/status/tick are compared with the frozen word implementation after every original finite test call.

## Evidence and reproduction

```
python linker.py
python audit.py
python build_and_test.py
python focused_tests.py
python big_boundary_tests.py
node component_node.mjs
node word_compare.mjs
python package.py
python package.py --validate
```

Tests freshly import the unchanged original source attachment, exercise signed/full-width rational operations,90 source physics cases, actual materialized geometry/event24/64-tick replay,20 count/parity branches, canonical/domain/index/capacity/u64 failures,8192/16385-bit boundaries, fixed-base64-step recipe and reopened future steps. The original5325-event journal (1453 calls/3872 writes) is preserved except new memory hashes. V8 compares the complete1MiB with Wasmtime after every call. Focused probes cover wide borrow, same-length/top-limb ordering, sign/zero decisions, maximum one-limb division and all bank-byte faults. All65536 eight-bit pairs across9 actual helpers are tested in V8. Finite tests/static source review are not universal equivalence proofs.

Read-only `package.py --validate` rechecks original PDF/all18 attachments, input/artifact hashes, deterministic link, WAT/WASM, binary audit, complete inventory, initializer and retained test bindings. Old packages and registries remain immutable; this new profile requires separate versioned admission.

Actual completed evidence:17,525 Wasmtime checks and630,356 V8 checks, plus the finite static inventory/current-binding checks. The main journal has1453 calls,3872 writes and complete1MiB cross-engine equality. The native-word comparison independently checks all64 application cells/status/tick after each of those calls.
