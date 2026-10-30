# Pinion and Maktub computational data through bit LUTs

This new backend preserves the admitted original Pinion finite integer dynamic core and original Maktub identified-pair mirror specialization. It is a separate module identity; the original source, prior WASM packages and frozen ECS v2 registry remain unchanged. Pinion's current state/row acts before future overlay/genes take effect, preserving source order.

The linker replaces269 original numeric expressions with packed-bit arithmetic, comparison, division/remainder, popcount and Boolean helpers. Computed data bits pass through retained truth LUTs. Native finite admission, index/address arithmetic and extraction/packing/selection of encoded bits remain explicitly inventoried. The implementation is not a whole one-bit CPU, a new source ISA or a gate-level hardware claim.

Public source ABI bytes are unchanged. A separate private helper region60000..61023 lies above the highest public candidate-overlay end58384. Source inputs, worlds, genes, native state, traces, TKG1 checkpoints and finite JSON event bytes preserve their original representations. The new default boot image keeps every old byte outside private memory and installs the canonical helper bank in that region. All65536 bytes, including helper work/code, remain retained state.

Two actual normalized recipes are supplied in `native_recipe.json`:

- `tomgrok.pinion.default.data-bit-lut-v1`: source-materialized default integer world, explicit jitter event1, native packed state/trace projection, RP32 output.
- `maktub.mirror.data-bit-lut-v1`: original coincident u32 state/description pair and explicitly admitted finite JSON `null` event; source inversion through the native mirror core.

Their nominal input/output types, units and logical clock meanings match their frozen source-compatible parent recipes. Native static-world materialization and finite JSON admission are explicit build/loader boundaries, not runtime arithmetic callbacks. Tape/HopRounds, float fields, adaptive/chart Maktub modes and generic runtime JSON parsing remain unsupported. Logical digital ticks do not establish apparatus time or physical measurement.

The added helper-bank failure intentionally returns status9 for public mutators. **Status9 is also the original Pinion native f8 lookup failure.** The read-only `lut_code_valid()` predicate distinguishes them:0 means the added helper bank is corrupt;1 leaves the original source error interpretation. No original valid-source-domain status was reassigned. On a helper fault, predicate/checkpoint return0, while row queries and void reset trap, all before any write. Valid reset initializes the canonical source/helper state only after checking the existing helper identity; corrupt helper bytes cannot be silently repaired by reset.

Ordinary source calls, queries and source-domain rejections can change private helper scratch even when original public bytes/results remain unchanged. This is explicit retained state. It is not claimed to be a full-memory no-op for every rejected source request. The outer `NativeRecipeKernel` executes in private copies and publishes only a successful candidate; all helper work is included in its full snapshot.

`tests.json` and `node_tests.json` record the actual fresh-source and second-engine runs. Packaging is refused until both exist and pass, all550 source cases/4080 actions are covered, and V8 has reproduced every recorded target call's full memory. The package also executes each recipe for64 steps through the pure retained-byte adapter, compares every byte outside private memory to the frozen parent recipe, and exercises full-memory snapshot/disk/future replay with filesystem access blocked after bootstrap. Exact counts are in the manifest and recipe receipts.

The sealed run passes64,178 source/Wasmtime checks and37,329 V8 checks over18,664 full-memory call receipts. The two recipe integrations add535 checks,128 steps and4 disk cuts with zero runtime filesystem attempts.

```powershell
# Producer runs are separately owned; do not rerun them during a live build.
python -B software/pinion_bit_exact/package.py
python -B software/pinion_bit_exact/package.py --validate
```

These are exact digital/source-conformance claims over admitted finite profiles. They do not imply calibrated sensor/actuator hardware, full-suite RTL or physical exactness.
