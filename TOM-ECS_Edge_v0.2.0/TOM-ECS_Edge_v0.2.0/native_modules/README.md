# Pinned native source modules

This directory executes eight existing TNOMTOM source profiles through six original WebAssembly kernels translated to C with official WABT `wasm2c` 1.0.42. The equations and production WASM bytes come from the pinned repository. The added code provides native lifecycle, typed ports, transaction rollback, snapshots, hashes and a small JNI interface. No network access, JavaScript runtime or filesystem bootstrap is required in the Android execution path.

The authoritative inventory is [source_manifest.json](source_manifest.json). Human-readable port metadata is [profiles.json](profiles.json); the public interface is [include/tnm_native.h](include/tnm_native.h). Original WASM, WAT, initializer bytes, recipes and relevant ABI documents remain under `upstream/`. The registry source is [TNOMTOM at the pinned commit](https://huggingface.co/c0mbatduckzz/TNOMTOM/blob/9823c27edf9a7e84c5a10b28b1970a22e69abf39/language/xd_ecs_hop_suite/registry.json).

## Exact coverage

| Public profile ID | Source family | Selected transition | Retained memory | Optional input |
|---|---|---|---:|---|
| `tomk.exact19.data-bit-lut-v1` | TOMK | Original State64/Cell48 opcode engine, compiled exact19 fixture; one `step` | 524,288 B | None in this recipe |
| `tomgrok.pinion.default.data-bit-lut-v1` | TOM-GROK | `pinion_step(1)`: old row acts before overlay rewrite | 65,536 B | None; jitter event is explicitly 1 |
| `maktub.mirror.data-bit-lut-v1` | Maktub-Tom-Klootwijk | Paired coincident binary state/description flip, retained JSON-null event | 65,536 B | 8 B: two little-endian u32 words, source binary-pair domain |
| `maktubiii.paired.QIS2.data-bit-lut-v1` | TOM-MAKTUBIII | `paired_step(3)` followed by `next_event_T()` | 65,536 B | 40 B: two canonical Q(i,√2) elements |
| `jtk.slog2.quarterturn.data-bit-lut-v1` | JTK-Twin-Viper | Exact selected Cartesian quarter-turn/fourth-product advance | 65,536 B | 48 B: three signed-i64 numerator/positive-i64 denominator pairs, declared metres |
| `tk.selected-quarterturn.data-bit-lut-v1` | TK-MK-ULTRA | Exact selected oscillator quarter-turn | 65,536 B | None; source tick capacity 256 |
| `xd.physics.rational8192.bit-data-v1` | XD-TAU-JKT | Literal bounded rational source oscillator/heat/coupling DAG, then publish 13 new state cells | 1,048,576 B | 2,064 B: canonical BigRat8192 force, declared model units |
| `xd.parent.parity6.native-v1` | XD-TAU/TNOMTOM controller | Two admitted transactions: fixed 72-bit input patch then six-vertex parity invocation | 1,048,576 B | None; this recipe fixes the parity fixture |

The seven contained model families and TNOMTOM assembly therefore have concrete executable coverage. This is a selected source-profile implementation. It does not implement every model operation, every arbitrary initial condition, the entire XD-ECS/11 compiler/history suite, or every repository application. The direct unchanged TOMK C bridge in `../ecs/vendor/tomk` additionally accepts bounded original `.tmg` programs through its separate ABI. TOMAGI's opcode called `JIT1` is a source state update; its name does not mean native machine-code compilation.

For MaktubIII, each 20-byte element represents `((A+B√2)+i(C+D√2))/Q`, with positive denominator, canonical GCD and source bound 2^20. This exact algebraic profile is distinct from original floating-point/PaperT execution. The twin profiles retain formal mathematical logarithm/root/clock meanings; they do not produce calibrated apparatus measurements. XD rational state uses up to 8,192 numerator/denominator bits and checked 16,400-bit intermediate work. These domain limits remain active even on a faster phone.

## Native contract

`tnm_create(profile_id)` allocates a fixed source memory and equal-sized rollback buffer, initializes the original module, executes its exact recipe and verifies the entire bootstrap memory hash against the original WASM oracle. Profile metadata publishes the repository revision, WASM hash, canonical recipe hash and initialized-memory hash. Unknown profiles are rejected. There is no path for loading arbitrary machine code or WASM.

`tnm_step` accepts either no new input or exactly the declared byte port. Source code validates its numeric domain; the wrapper does not silently cast sensor values into model numbers. Before mutation, it copies every retained byte into the preallocated rollback buffer. Calls execute in the original recipe order. A trap, rejected source status or invalid output padding restores every byte and leaves the wrapper sequence unchanged. Attempt diagnostics can still be returned to the enclosing ECS receipt. Successful steps advance the sequence and hash the complete memory, including helper tables and scratch. There is no per-step heap allocation.

The original binaries have no host imports, tables, mutable globals or retained data/element segment state. Each has one fixed, unshared linear memory. Therefore linear memory, wrapper sequence and the pinned profile identity are the complete between-call state of this adapter. `tnm_restore_memory` is deliberately a trusted byte-state import: it checks the exact size, but it does not prove the snapshot was reachable. Bind the profile identities and authenticate or replay the enclosing snapshot before restoring it. The ECS canonical state records the full source memory and profile hashes.

All eight source memories together occupy **2,949,120 bytes (2.8125 MiB)**. Their rollback copies bring this to **5,898,240 bytes (5.625 MiB)**, before code, Android, corpus and other application storage. Readonly initializer binaries total 1,310,992 bytes; sparse C initializers preserve their exact bytes. Fixed capacities bound storage and operand widths. They do not establish a worst-case measured duration or CPU-cycle budget on the POCO. The caller must serialize each instance and run work off the UI thread.

The convenience `tnm_run_json` starts a new default instance and runs 1–64 events, applying optional lowercase-hex input to the first event only. It returns exact bytes, nominal type/unit/clock, source statuses and the complete memory digest. This event-count limit belongs to the UI helper, not to a new physical-time law. Existing source limits, such as TK tick 256 or u64 sequence exhaustion, reject without wrapping.

The current ECS event encoding can transport up to 512 input bytes through its component span. Consequently the 2,064-byte XD force port is available through the direct native/JNI interface; ECS can still execute that profile with its retained default force. No universal telemetry-to-model conversion is implied.

## Build and verification

Add `add_subdirectory(native_modules)` and link `edge_native_modules`. The checked-in generated C makes WABT and Node unnecessary for normal builds. C11, explicit Wasm bounds checks, malloc-backed fixed memory, no Segue optimization and no process signal handler are selected. The wrapper catches traps in C, so no C++ destructor is crossed by `longjmp`. `-fno-optimize-sibling-calls` and `-frounding-math` follow the translator's runtime guidance.

To reproduce the translation from a previously fetched pinned source tree:

```sh
python tools/prepare.py --source /path/to/pinned/TNOMTOM --wabt /path/to/wabt-1.0.42
node tools/golden.mjs
python tools/generate_adapter.py
python tools/generate_tests.py
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure
```

The source was inspected before execution. `golden.mjs` runs the unchanged source recipe adapter and original Wasm with no host imports. The native tests compare each profile's bootstrap and four successive **complete-memory hashes**, projections, outputs and statuses with that oracle. Additional checks cover restore/replay, exact input width, invalid canonical encodings, output capacity, sequence exhaustion and TK's explicit event limit. These are cross-runtime conformance tests; agreement with the same source is not a proof of all inputs, general intelligence, physical validity or measured phone performance. See `tests/validation.json` for observed results and test scope.

## Rights and attribution

Original TNOMTOM contributions retain the author's reserved-rights notice in `upstream/README.md`; this owner-directed integration does not assign a new public license. Original component notices remain applicable. WABT runtime files retain their Apache 2.0 headers and `runtime/LICENSE`; unmodified originals are also retained under `upstream/wabt-runtime`. `runtime/PATCHES.md` records the single allocation-failure change. The source kernels are not relicensed by the WABT runtime license.
