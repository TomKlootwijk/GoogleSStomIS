# XD exact rational numeric module / ABI 1

The production artifact is `physics.wasm`, with one fixed non-shared 16-page memory (1,048,576 bytes), no imports, no floating types/instructions, and no mutable WASM globals. This is the original XD v1.5 **discrete numerical** physics specialization. Geometry, parity construction, event/CRDT materialization and apparatus calibration remain external. Native base-2^16 word arithmetic is the semantic implementation stage; it is not yet a one-bit-LUT lowering.

Every rational is exact within its admitted finite capacity. This does not assert an exact continuum solver or measured physical device.

## Memory

| Offset/range | Meaning |
|---|---|
| 0..3 | Last status: 0 success; 1 cell index/span; 2 noncanonical rational; 3 physical/arithmetic domain; 4 finite capacity; 5 exhausted u64 tick. |
| 8..15 | Coupled source tick, unsigned little-endian u64. |
| 4096..136191 | 64 application Rat cells, stride 2064 bytes. |
| 196608..526847 | 160 private RatScratch cells, same layout. |
| 655360..721663 | 32 private BigScratch slots, stride 2072, 1025 unsigned 16-bit limbs each. |

RatScratch/BigScratch are declared noncausal workspaces: their initial bytes do not affect a valid next result. Their actual bytes are nevertheless included in complete-memory replay. A public call owns its native memory until it returns; concurrent host writes or observation as a partially published application state are not admitted.

Each application/scratch Rat is:

| Relative bytes | Type/meaning |
|---|---|
| 0..3 | u32 sign, 0 positive or zero, 1 negative. |
| 4..7 | Numerator limb count, 0..512. |
| 8..11 | Denominator limb count, 1..512. |
| 12..15 | Reserved u32, exactly zero. |
| 16..1039 | Absolute numerator, 512 little-endian u16 limbs. |
| 1040..2063 | Positive denominator, 512 little-endian u16 limbs. |

Numerator/denominator are reduced by GCD. The highest used limb is nonzero, unused tail limbs are zero, and zero is exclusively sign 0, numerator length 0, denominator 1. Each numerator and denominator supports up to **8192 bits**. BigScratch header length is at +0, limbs at +16, with zero tail/padding. It supports **16400 intermediate bits**, including the 16385-bit sum of two cross-products of full-size external operands. Intermediate overflow or a reduced result exceeding the Rat capacity returns status 4; no bits are silently discarded.

The ordinary 16-bit multiplication recurrence has maximum `65535*65535 + 65535 + 65535 = 2^32-1`. Thus its product, existing limb and carry fit the unsigned i32 operation exactly. Canonicalization uses exact binary GCD and exact long division; IEEE arithmetic is absent.

## Pure exports

All cell arguments are unsigned cell indices, not byte pointers. `reset()->i32` clears this module's own memory and installs canonical zero in all 64 application cells. `abi_version()->i32` returns 1. `last_status()->i32` reads status; `tick()->i64` transports the u64 counter's bits.

`rat_add/sub/mul/div(dst,a,b)->i32` and `rat_neg(dst,a)->i32` return status. Aliasing output and input cells is supported. `rat_cmp(a,b)->i32` returns -1/0/+1 on success; callers must also check `last_status()==0` because its data-return lane is not a separate error channel. These rational primitives do not change the tick.

Before an application Rat output is copied, its complete input encoding is validated and the result is reduced/admitted. Failed calls preserve **all 64 application cells and the coupled tick**. Status and noncausal scratch may change. These are finite profile guards, not an extra source repair/clipping stage.

## Original source operators

The generic DAG lowerer reads the unchanged source AST of `oscillator_midpoint`, `heat_pair_BE` and `physics_energy` from the pinned original PDF attachment `v15_events_coupling.py`. It emits literal rational operations; the host does not numerically execute these operators for production.

| Export `(input_base,output_base)->status` | Input order | Output order |
|---|---|---|
| `oscillator` | q, p, mass, stiffness, damping, force, h | qnew, pnew, damping heat, force-port work |
| `heat` | E0, E1, C0, C1, conductance, h | E0new, E1new |
| `energy` | q, p, mass, stiffness, E0, E1 | Total source energy |

Mass, capacities and h are strictly positive. Stiffness, damping and conductance are nonnegative. Signed q, p, force and mathematical heat inputs remain exact rationals. There is no implicit floating time conversion. Compatible quantity labels are declared model displacement/momentum/mass/stiffness/energy/heat-capacity/conductance/force/time; physical SI calibration is not supplied by this software module.

## Numeric specialization of `replay_physics`

`coupled(input_base,output_base,params_base,sample_count,graph_bit)->status` accepts 13 state Rats and 5 parameter Rats. `sample_count` is an integer 0..9 and `graph_bit` is 0 or 1. They explicitly stand for externally materialized source geometry/parity results; the target does not infer or recompute their geometry/CRDT provenance.

The state order is q, p, mass, stiffness, E0, E1, C0, C1, time, parameter-work ledger, port-work ledger, beam-input ledger, beam-output ledger. Parameters are new stiffness, force, beam power, conductance and h.

The literal coupled operator DAG preserves source stage order:

1. Parameter work `(knew-k)*q^2/2`, stiffness replacement and parameter ledger.
2. `kappa=1/4+(sample_count/9)/5`, `G_eff=G+graph_bit/10`.
3. Original midpoint oscillator with damping 1/3; damping heat into E0 and signed port work into its ledger.
4. `beamIn=h*P`, `beamOut=beamIn/(1+kappa)`; net energy into E1 and both beam ledgers.
5. Original backward-Euler heat pair with G_eff.
6. Derived numeric outputs; geometry/bit/program objects stay external.
7. Time += h; u64 tick += 1 after all outputs are admitted.

New and old stiffness, beam power, conductance, heat energies and time are nonnegative; mass, capacities and h are positive. Force and signed work ledgers can have either sign. Tick exhaustion returns 5 before application publication.

The 28 consecutive outputs are 13 new state Rats; then parameter work, kappa, G_eff, beamIn, beamOut, Eold, Enew, and `Enew-Eold-parameterWork-portWork-beamIn+beamOut`; then seven **computed** stage residuals in the order above. Constants, arithmetic, audit energy evaluations and their data dependencies are visible in `operator_dag.json`. The coupled graph is a transparent literal numeric specialization of the original replay body, composed from the three source-AST operators; it is not a claim that the entire event/geometry replay function was compiled.

Outputs are staged privately and copied only after all checks and exact reductions succeed. All statically bounded copies and the final tick store are then nonfailing under this ABI. Atomic software publication is owned by the leading XD candidate/commit wrapper.

## Default retained recipe

`default_profile.memory.bin` is initialized by actual unchanged `initial_physics()` and `base_profile().assignments`: q=2/3, p=5/4, mass=2, k=3, heat=[4,7], capacities=[2,3], time/ledgers/tick=0; parameters k=3, F=1/5, P=7/3, G=1/6, h=1/5.

The actual source base cube has sampled count 3 and graph bit 0. `native_recipe.json` declares `coupled(0,32,13,3,0)`, followed **only on success** by copying 13 output state Rats from cells 32..44 into state cells 0..12. This explicit profile scheduling does not port geometry or CRDTs. It has been recurrently checked for 64 steps against original fixed-base replay.

The recipe's q projection is one complete canonical Rat at byte 4096, 2064 bytes / 16512 bits, unit `declared_model.displacement`. The optional force input is cell 14 at byte 32992, unit `declared_model.force`. Both are typed model quantities, not calibrated physical I/O. Full native memory and retained module/profile identities must accompany replay.


## New DATA bit-LUT version

The public layout above is unchanged. New private workspace is[900000,901024), disjoint from BigScratch ending721664. Relative128..135 contain the eight table bytes;136 contains magic0x424c4131. Other bytes are bounded helper buffers. All1MiB remains replay state.

Readonly `code_valid()->i32` returns1 only for the correct bank. Every numerical export first rejects invalid bank with status6, changing only status@0. `reset()` explicitly resets original memory/canonical cells and rebuilds the bank. Original errors1..5 remain unchanged; getters do not require the bank.

Profile ID `xd.physics.rational8192.bit-data-v1`: `coupled(0,32,13,3,0)`, then only on status0 copy26832 bytes from70144 to4096. This explicit scheduling publishes13 output-state cells as next input state. Projection q:2064 bytes@4096,16512bits,typecanonical_BigRat8192,unitdeclared_model.displacement. Optional force:2064 bytes@32992,unitdeclared_model.force. Clock:timecell8,hcell17=1/5,u64tick@8. No SI apparatus calibration is supplied.

Canonical application cells/status/tick are source-equivalent. Scratch optimizations can leave different BigScratch20..22 contents from the word module; full scratch is retained and replayed within the new implementation.

Source errors1..5 may change noncausal scratch/status while preserving application cells and tick as specified by the original module. A parent adapter requiring whole-memory rejection must retain its private-clone/atomic-publish rule. Fault6 specifically occurs before original scratch work and changes only status.
