# Twin data-LUT backend ABI 1

All original numeric input cells, output records, fixed capacities, mathematical
domains and API argument/result types are inherited from the frozen
[`software/twin_exact/ABI.md`](../twin_exact/ABI.md). Exact mathematical profile
semantics and symbolic descriptor meanings are unchanged. New immutable module
identity and distinct recipe IDs select this backend; an old whole-memory image
does not contain this backend's retained LUT bank and must not be loaded unchanged.

One nonshared fixed64KiB linear memory contains all causal execution state. Source
buffers stay at their original offsets. Private60000..61023 contains the linked
bit helpers and division work; truth bytes/ABI identity occupy60128..60139. Every
byte is included in a complete snapshot. Host input writes follow the original
input/parameter ABI; arbitrary writes to code, state or private work are outside
admitted call sequencing. The immutable module and retained schema identities are
separately bound in `manifest.json` and each new recipe.

The original status APIs are `jtk_encode()`, `jtk_pushforward()`,
`jtk_fourth(tick:i32)`, `jtk_advance()`, `jtk_inverse()`,
`jtk_compaction(stage:i32,advance:i32)`, `jtk_energy()`, `tk_init()`,
`tk_validate()`, `tk_normalize()`, `tk_step()`, `tk_sdf()` and `tk_chart_metric()`.
Statuses0..5 keep their original meaning for valid code. New status6 means altered
retained helper truth/ABI bytes. That return occurs before **any memory write**;
even the old status field remains unchanged. The returned status is authoritative
for this new fault lane.

`reset()` remains void. `code_valid()` and `abi_version()` remain data queries.
All three trap without writes on altered helper identity. A valid reset matches
the original reset outside private space and initializes the private workspace.
Fresh module bootstrap initializes code before the guarded reset; exported reset
cannot repair a corrupted bank.

Two added read-only queries require no valid helper bank:
`lut_code_valid()->i32` returns0/1 and `lut_workspace_offset()->i32` returns60000.
They never mutate source state or private work. There are no other production
function exports, host imports, globals, tables or hidden segments. Test-only primitive
exports are in `helper_probes.wasm`, a separate artifact.

Packed rational cells remain signed-i64 numerator/positive-i64 denominator,16bytes,
canonical GCD and zero0/1, magnitudes at most2^60-1. Checked intermediate bounds
and every capacity rejection remain the frozen source profile's bounds. The new
helpers implement these word operations exactly; they do not widen the admitted
source domain, renormalize float state, introduce phase caching or repair a failed
state. Source errors may change original diagnostics/scratch as before; codefault6
is the separate no-write extension.

`jtk_native_recipe.json` selects the exact geometric quarter-turn program with a
48-byte current Cartesian projection at256, in metres. `tk_native_recipe.json`
selects the source a1 quarter-turn oscillator with the32-byte q,r projection at8448,
dimensionless. The corresponding new64KiB initializer files preserve every old
byte outside private space and supply canonical new LUT state. Source clocks,
units, formal ln/root/atan descriptors and uncalibrated mathematical status remain
separate from the leading XD scheduler and any actual apparatus interface.
