# MaktubIII exact mathematical operators through bit LUTs

This is a **new, separately identified backend** for the existing ideal/algebraic MaktubIII profile over `Q(i,√2)`. Its H2, double-Hadamard, DFT/IDFT, coherent pin/butterfly/reconstruction, kinematic-chain, restricted circle and paired Act/Rewrite equations are unchanged. The original raw binary64 programs and the frozen ideal word backend remain untouched.

Every original non-address numeric expression is lowered to the frozen packed-bit arithmetic/division helpers:347 expression replacements, including exact unsigned GCD, signed/unsigned quotient/remainder, coefficient arithmetic, comparisons, casts and counters. The actual binary has **no native i64 arithmetic/comparison**; its remaining i64 instructions are constants, loads and stores. Three native i32 remainder instructions remain in the unchanged helper's rotate/shift index normalization. Computational coefficient/word division and remainder use the bit-LUT implementation. Native i32 memory address/index/control and encoded-bit extraction/packing remain explicit and fully inventoried. This is computational-data LUT lowering, not a whole one-bit CPU or gate-level hardware implementation.

The13743byte production WASM has no imports or floats and one fixed64KiB memory. Public buffers and source capacities match the old ideal profile. A disjoint1024byte private region at60000..61023 holds the retained arithmetic truth tables and division work. All complete native memory, including private work, is execution state.

The canonical field record remains20bytes: `((A+B√2)+i(C+D√2))/Q`, with four signed i32 coefficients, positive i32 denominator, GCD across all five values, and stored magnitude/denominator bound2^20. The original intermediate bound remains below2^43. No rounding, floating fallback or raw-native normalization repair is introduced. Unsupported PaperT/log/address/chart/full-transaction modes remain unsupported exactly as documented by the parent source inventory.

Exports preserve the old API and add `lut_code_valid()` and `lut_workspace_offset()`. On changed LUT identity, `apply`, `paired_step`, `next_event_T`, and `search` return new status9 **before any memory write**. Predicate/value queries and void `reset` trap before writes. Only module bootstrap initializes truth tables. A valid exported reset clears source state and private work while preserving verified code bytes; it cannot silently repair corrupted LUTs. Use the supplied new boot images, not an old whole-memory image which would overwrite the new private code bank.

`native_recipe.json` supplies new IDs `maktubiii.h2.QIS2.data-bit-lut-v1` and `maktubiii.paired.QIS2.data-bit-lut-v1`. Their output types and scheduling remain the old ideal profile's meanings. The H2 profile explicitly copies its output back to its input; the paired profile explicitly advances the supplied event coordinate. Neither scheduling helper is a physical clock law or full source PaperT implementation. Existing ECS registries were not modified.

Actual verification passed11,198 Wasmtime checks and10,302 Node/V8 checks. All371 frozen mathematical-oracle scenarios and764 source actions match freshly executed old ideal backend statuses and **every byte outside the private region**. Both engines also match every new65536byte memory image, including private work. Two64-tick recipes,10 actual disk reopens,1,344 code-fault cases, and80 division/remainder boundary cases pass. Signed `MIN/-1` division traps; the corresponding remainder is zero. This mathematical profile's valid coefficient intermediates do not reach signed64 overflow.

```powershell
python -B software/maktubiii_bit_exact/build_and_test.py
node software/maktubiii_bit_exact/cross_runtime_node.mjs
python -B software/maktubiii_bit_exact/package.py
python -B software/maktubiii_bit_exact/package.py --validate
```

Python/Node arithmetic and the unchanged backend are test oracles only. Production operators execute in the new integer-only WASM. Digital exactness does not establish calibrated physical measurement, QPU execution or continuum exactness. See [SPEC.md](SPEC.md) and [memory_layout.json](memory_layout.json).
