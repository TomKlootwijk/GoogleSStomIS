# Exact source-profile data-bit lowering contract

The authoritative mathematical contract remains the frozen `software/maktubiii_exact/SPEC.md` and its pinned original MaktubIII source inventory. This document defines a new implementation identity for those admitted ideal equations. It does not redefine the model as raw binary64 source execution.

## Static composition and data operations

The build reads hash-pinned original ideal WAT, the generic S-expression parser/linker, the complete TOMK numeric adapters, the frozen1..64bit arithmetic WAT, and the frozen division fragment. Original files are never edited. Address relocation adds60000 only to memory-operation address operands. Numeric constants, signed coefficients, loop widths and literal tables are not arbitrarily relocated.

The arithmetic library is linked once. Division's `$B_*` references map to those same renamed helpers, so both use the same retained truth bytes. Its14 fragment functions are systematically renamed; their equations and loop order remain unchanged. Full linked-helper AST identities are checked against the pinned source under this name/address transformation. No host arithmetic callback or import implements a production operator.

All original non-address i32/i64 arithmetic/bit/shift/comparison/cast expressions are replaced by width-specific packed-word calls. Original GCD is replaced by the already implemented unsigned-word LUT Euclid operator with the same zero/base cases. The source's absolute-value sign test/negation is LUT computed. Signed extension extracts the existing sign bit as transport and computes its repeated high word with LUT subtraction; unsigned extension and truncation copy encoded bits and literal zero padding. Constants and selection/copy of supplied or already computed words are transport.

The linked bit library emits computed result bits through retained Boolean tables. Data arithmetic, comparison and normalization do not fall back to native word multiplication/division. Native operations that remain are explicitly classified: finite loops and indices, memory addresses, code/width/padding admission, and extraction/packing/selection of existing encoded bits. The binary decoder confirms that i64 is used only for constants, loads and stores. Three i32 remainder instructions remain in the frozen rotate/shift helper's index normalization; source computational-data DIV/REM operations are all replaced. Source address arithmetic can still contain native i32 multiplication/shifts; it is not a computed algebraic coefficient.

This structural dataflow classification is not a SAT proof of the whole program. The exact helper algorithms and source equations are additionally checked by the inherited helper evidence, mathematical-oracle vectors, fresh old-backend replay, cross-engine full-memory comparison and independent review.

## Exact primitive semantics

The public mathematical element is `(A,B,C,D,Q)` representing `((A+B√2)+i(C+D√2))/Q`. Denominator is positive; GCD across all coefficients and Q is1; canonical zero has denominator1. Every stored magnitude and denominator is at most2^20. Each primitive reduces and checks capacity before later field operations. The original add/sub bound2M², product bound6M² and denominator boundM² remain below2^43 for M=2^20.

Binary adapters preserve two's-complement modular i32/i64 semantics. Signed quotient truncates toward zero; signed remainder has the dividend's sign. The general frozen helper returns an error for zero divisors or unrepresentable signed `MIN/-1` quotient. The adapter converts those errors to the native Wasm primitive trap. `MIN%-1` succeeds with zero remainder, matching the native primitive. The source ideal profile never needs signed-MIN magnitude arithmetic because all admitted intermediates satisfy the above bound. Dedicated primitive probe exports exist only in `primitive_probe.wasm`, a test artifact; they are not extra production API.

DFT forward sign is negative; inverse sign is positive with1/N. H2 retains its exact1/√2 coefficient in the same field. Pin/butterfly functions preserve their source distinction between spectra and restored samples. The elementwise double-Hadamard operator does not become a general unitary transform. Paired actions read old alpha and old gate2 before committing requested description values for the future. Revision increments on each source event as before. Restricted circles reject radicals outside the admitted field; they are not approximated.

## Memory and failure

The original1page ABI is unchanged outside60000..61023. Existing source regions stop below18552. The private region contains:

| Relative bytes | Role |
|---|---|
|0..23|Arithmetic operands and result|
|24..31,64..87|Arithmetic carry/work|
|128..139|Eight truth bytes and four-byte ABI identity|
|192..199|Shift-count transport|
|256..271|Division Q and R|
|280..287|Quotient-valid bit with zero padding|
|512..583|Division operands, magnitudes, quotient/remainder and GCD work|
|Remaining private bytes|Retained reserved/work bytes|

Memory is fixed, unshared, import-free, and contains no hidden global/table/segment state. Every complete memory image is snapshot state, not only source State128 and outputs.

Bootstrap initializes the retained LUT and then calls the checked source reset. Exported reset first verifies code, clears the original public regions in two ranges around private memory, clears private work around the verified12byte code bank, and performs the original source initialization. It does not repair truth bytes. A corrupt bank causes void reset or value/predicate queries to trap before any write. The four status-returning action interfaces return9 before the old `$begin` or any candidate/status/scratch write. This keeps full memory unchanged on a code fault. Existing source errors0..8 retain their meanings and original public failure behavior; scratch/private state may change during an ordinary mathematical domain rejection as in the inherited candidate model.

New default H2 and paired images copy exactly the old image's bytes outside private memory and use the deterministic new bootstrap's private state. This is an explicit build-time boot-profile conversion. It is not silent runtime migration or repair of an arbitrary old snapshot. New recipes bind new module/image identities; the old ECS registry and old recipes remain untouched.

## Evidence and boundaries

The retained test vectors bind the original371scenario mathematical oracle file and execute the unchanged old ideal WASM afresh. For all764 actions, new status, outputs, State128 and all64512 bytes outside private memory match. The second engine compares all65536 new bytes to Wasmtime after every action, so private scratch/code state is included. Both64-event recipe chains also compare complete new memory and projections at every event. Ten snapshots are saved to disk and reopened before future operations. All96 single-bit corruptions of the12byte code bank are exercised against14 status/query/reset interfaces:1,344 cases per engine, all before-write failures. Separate boundary probes include32/64bit zero division, signed overflow, negative quotient/remainder and high unsigned bit patterns.

The new backend remains a classical exact digital implementation of an ideal mathematical source restriction. It does not claim full MaktubIII.step/PaperT/log-address/chart compatibility, raw floating-point byte equivalence, quantum-state preparation, device calibration, a whole bit-serial CPU or manufactured hardware. Those unsupported modes and distinctions remain visible in the inherited source inventory and the new manifest.
