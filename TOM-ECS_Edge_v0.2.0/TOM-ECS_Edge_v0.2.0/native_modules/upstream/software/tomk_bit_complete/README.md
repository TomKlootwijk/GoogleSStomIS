# TOMK: computational data operations through one-bit LUTs

`tomagi.wasm` is a new contained TOMK backend under XD-TAU. It preserves the pinned original finite State64, Cell48, TMG program format and sixteen native opcodes. The actual source `mix32` and **199 additional original numeric expressions** now execute Boolean LUT compositions: 32/64-bit arithmetic, source masks/shifts/rotates, signed/unsigned data comparisons, key hi/lo paths, wide geometry, floor wraps, abs/max, parity/population count and the four LSYS divisions. Original sources and every previously frozen backend/library are unchanged.

“Data complete” means the computational data path of this admitted native source profile is lowered. Wider loop/search/index/address control, code/type/budget admission, packed-bit extraction/transport, constants, and selection/copy of already represented words remain explicit native operations. This is not a whole one-bit CPU, hardware realization, complete six-model port, machine-checked universal equivalence proof or empirical physical exactness claim.

## Literal source semantics

The source remains `system_of_systems/integration/vendor/TOMK/src/python/tomagi/core.py`. No replacement ISA is introduced. The original signed/modular/fetched-cell ordering, native normalization, old-key lineage and atomic candidate State64 commit remain the semantic authority.

The unchanged bit library retains XOR `0x06`, AND `0x08`, OR `0x0e`, NOT `0x01`, sum `0x96`, carry `0xe8`, identity `0x02` and XNOR `0x09`. Its sole computed-bit writer evaluates a truth table before packing that result bit. Signed 64-bit parameters/results in adapters are **packed-word transport** using `i64.store/load`; their arithmetic and comparison results execute the same bit-serial helpers at width 64. Constants are literal operands.

PHI and TIME use the source's arithmetic right shift on the signed-wide raw sum. That computes floor division, so a negative nonmultiple rounds down. LSYS instead has the source's strictly positive divisor `2^clamp(arg1,0,30)` and rounds toward zero. Its new helper checks that exact positive-power-of-two domain, computes the unsigned magnitude with LUT subtraction, shifts that magnitude logically, then restores the sign through LUT subtraction. In particular `-3 / 2 = -1`, while PHI/TIME's signed floor shift gives `-2`. `INT32_MIN` magnitude is the unsigned word `0x80000000`; it is handled without a native signed-division overflow. No arbitrary signed-division opcode is added.

Sign extension copies the original low 32 bits, extracts the encoded sign bit, and computes the high sign-fill word using LUT subtraction. Unsigned extension uses literal zero high bits. Wrapping selects the original low word by packed store/load. Consequently the compiled production binary has no native numeric cast, division, population-count or XOR instructions. Its only `i64` instructions are literal constants and packed loads/stores.

The original admitted wide expressions arise from signed32 sums/differences and 20/18/12-bit coordinates. Their absolute magnitude is below `2^33`, so the original wide mathematical values fit signed64. The source never asks for mathematical `abs(INT64_MIN)`; that unrepresentable signed64 absolute value is not claimed as an admitted source input.

## Exact inventory and retained workspace

`linker.py` reuses the previously frozen S-expression parser/address linker and the unchanged bit library, with exact input SHA checks. Only memory-address operands relocate by 220000; arithmetic constants do not. The original whole-64KiB reset is omitted. A private initializer clears only 256 bytes and installs its retained LUT identity.

Workspace **220000..220255** remains between maximum upload end 200832 and committed TMG base 262144. It holds packed A/B/result, carry metadata, accumulator, mix intermediate, retained LUT/code bytes, and a wide shift-count transport slot at +192. The fixed non-shared eight-page memory, State64 at 256, candidate at 320, upload at 4096 and committed program at 262144 retain their original ABI offsets.

`link_report.json` identifies all 199 replacements and inventories **every remaining native numeric AST instruction**, with exact function/path/expression and its allowed role. The build rejects an unclassified data operation. `lowering_inventory.json` combines this with the complete actual compiled function/instruction decode. The bit library's data-result ownership is unchanged and bound to its prior local dataflow proof. Admission/search/index controls do not become computational State64 arithmetic by being retained as native instructions; these exceptions remain visible in the inventory.

## Fault behavior and publication

All original exports remain, with `lut_code_valid()` and `lut_workspace_offset()` added. Equal valid admitted source/program/state bytes yield the same native state/return values in the actual conformance tests.

Unloaded step/reset and already-HALT step keep the native early-return precedence. A loaded nonhalted `step`, any `load`, or a loaded `reset` rejects a corrupted retained LUT/identity with explicit **status 9 before source/candidate/workspace mutation**; only the wrapper's last-result word at byte 4 may change. `run` propagates the fault. Native reset/load do not silently repair the LUT bank. Successful validation can use the helper scratch area while preserving code/LUT identity.

`key_hi`, `key_lo` and loaded `find_key` return data/index words and have no separate status lane. A corrupted LUT therefore causes an explicit WASM trap before helper writes, rather than returning an untrusted word that could alias a valid result. These invalid-code fault extensions are declared wrapper behavior, not new source opcodes. Leading XD owns module identity, full memory snapshots and external writes; concurrent host mutation during a call is not admitted.

## Actual checks and bounds

The build rechecks the frozen original/helper/partial-backend bindings. It executes all 4,479 source vectors against fresh unchanged Python `core.step`, the original native WASM and this new backend. Returns, all 64 State64 bytes and every memory byte outside the explicitly added private workspace match. Node/V8 independently executes all 4,479 cases and matches the complete new 524,288-byte memory hash after every case.

The unchanged seeded compiler again compiles the original LICENSE literal into this folder. The packet must equal the original admitted packet; all 268 actual source transitions and all 1,070 emitted bytes reproduce the original LICENSE. The exact19 and all16 fixtures also match stepwise and in batches. Maximum 4,096-cell programs, fixed memory limits, full snapshot/next-call replay, every LUT/identity-byte fault, load/reset atomic rejection, direct-query traps and HALT precedence are checked.

Additional exact integer probes cover every LSYS shift 0..30 across signed32 boundaries and seeded values; modular64 boundaries/random pairs, signed comparisons, floor shifts, max/abs within the source range, sign/zero extension and wrapping; and 200 literal source key queries. A separate test-only WASM adds exports to the **same production helper functions**, without changing their bodies. It is not the production artifact. Wasmtime and Node execute the probes; the original integer core and host integer arithmetic supply test oracles only.

`binary_audit.py` is the already frozen strict integer decoder with its decoded start-section support; standard Wasmtime/Node validation is separate. Run `python software/tomk_bit_complete/build_and_test.py` to reproduce. `--validate` checks fresh current source/link/binary/inventory bindings without rerunning the retained numerical tests.
