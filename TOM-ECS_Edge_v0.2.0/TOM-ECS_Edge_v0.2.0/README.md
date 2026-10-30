# TOM-ECS Edge · v0.2.0

A native Android/C++ implementation for the POCO X7 Pro 12 GB edition, built from
Tom Klootwijk's supplied log-net-D and Google-search documents and the public
`c0mbatduckzz` Hugging Face repositories. Prepared 30 October 2026.

The central deliverable is a **modular deterministic ECS runtime** plus a new
**TOM-ECS/1 `.tecs` device format**. The application contains native operators from
the existing symbolic model families, their exact source profiles and boot data,
the original log-net-D LUTs, and a native replay verifier. A Java Android UI owns
permissions, sensors, HTTPS and files; the mathematical operators run as compiled
C/C++ inside the Android process.

This is a working bounded implementation of selected published operators. Full
XD-ECS/11 constructor/history/compiler compatibility, every historical repository
artifact, and a newly trained general language model are separate projects.

## Start with the application

Install the supplied ARM64 debug APK on the phone, then open **TOM-ECS Edge**.
The APK is for personal testing; the build is not a store release or a measured
POCO performance certification. The package name remains `nl.lognetd.edge`.

The **foreground live agent** retains a telemetry entity and eight native profile
instances between observations. Start/stop controls manage acquisition; reset
constructs a new state. Explicit logical epochs record available RAM, a quantized
accelerometer observation, its validity and thermal status. A recorded admission
rule decides whether the native profiles advance. This session is held in process
memory; it is not a durable checkpoint service or a background Android service.

1. **Validate and replay bundled model** validates the `.tecs` directory, sizes,
   hashes, capacities, source profile fingerprints and event transcript. It runs
   the same package in two fresh native kernels and displays the canonical state
   SHA-256, event counts and equality result.
2. **Native symbolic profiles** exposes the eight pinned profiles described below.
   Select a profile, retain its default input or supply the precise typed input
   bytes, and run a bounded number of events. The result includes source hashes,
   exact output bytes, full-memory digest, sequence and source call statuses.
3. **Capture phone integers and verify replay** records a phone snapshot as integer
   events and replays those captured values. Live acquisition and quantization
   precede deterministic execution; replay does not predict the next measurement.
4. Sensor controls, a one-shot location request, public NOAA refresh, local history,
   and a Google search button remain available. The Google button opens the entered
   query in a browser; search results are not automatically imported or executed.
5. **Import a `.tecs` bundle** admits another finite package only after native
   validation. Imported data cannot install arbitrary native code or new opcodes.

See `android/README.md` for the exact current controls, build record and device
checks. Source-specific ports show their declared units and representation; a
phone accelerometer value is not automatically reinterpreted as a physics-model
force, a rational displacement or an uncalibrated geographic observation.

## Actual Hugging Face discovery and coverage

The public profile https://huggingface.co/c0mbatduckzz exposes eight model
repositories and two datasets. All ten are inventoried at immutable revisions in
`provenance/huggingface/source_manifest.json`; the compact inventory is
`config/model_registry.json`. Public profile discovery does not supply private
account credentials or access to private repositories.

The model repositories contain symbolic programs, operator specifications,
codecs, source documents and executable kernels. The audited inventories contain
no conventional GGUF, safetensors, PyTorch or ONNX neural-weight payloads. The
implementation therefore preserves source operator semantics and native profiles.

| Repository | Concrete role in this version |
|---|---|
| `TOMK` | Original MIT C runtime and `.tmg` exact19 fixture; also the TNOMTOM bit-LUT State64/Cell48 native profile |
| `TOM-GROK` | Published Pinion read/act/overlay finite integer profile |
| `Maktub-Tom-Klootwijk` | Published paired state/description mirror specialization |
| `TOM-MAKTUBIII` | Published paired QIS2 rational/algebraic profile |
| `JTK-Twin-Viper` | Published exact selected quarter-turn rational profile |
| `TK-MK-ULTRA` | Published selected quarter-turn mathematical profile |
| `XD-TAU-JKT` | Leading XD source family: bounded rational physics and six-vertex parity controller profiles |
| `TNOMTOM` | Pinned recipe, bytecode and boot-data assembly containing the eight native profiles; source XD-ECS/11 contract retained in the audit |
| Dataset `TOM-GROK` | Pinned research/reference assets and provenance, kept distinct from executable model state |
| Dataset `TK-SROK-NL942-19900710` | Pinned research/reference assets and provenance, kept distinct from executable model state |

Eight native profiles cover **seven underlying source families**, with two XD
profiles. The six original Wasm kernels are converted with official WABT
`wasm2c` 1.0.42 into C and compiled into the Android native library. This is
build-time native compilation. No WebView, Node interpreter, remote inference
server, or runtime download of Wasm code is needed to run those profiles.

`native_modules/profiles.json` gives every full profile ID, port type, unit, clock,
source scope, memory size, original Wasm SHA, recipe SHA and initialized-memory
SHA. Preserve these distinctions: selected exact rational profiles are not claims
of byte equality with every original binary64 implementation, full JSON/FFT
interpreter support, or physical calibration.

The source TNOMTOM XD-ECS/11 system is broader than this phone profile. It has a
Node/Wasm host, versioned constructors, routes, atomic epochs and retained
constructor history. This version reuses admitted source recipes and full native
operator memory; it does not relabel a smaller kernel as full XD-ECS/11 compliance.

## Deterministic ECS contract

`ecs/include/edge_ai/ecs.hpp` defines the public C++20 API.

- Entities have stable slot/generation IDs. Components use fixed-capacity,
  component-major storage with separate presence bits. Missing is distinct from zero.
- Event48 records carry logical tick, source ID/epoch/sequence, entity generation,
  admitted opcode, component and argument. Ordering is `(tick, source, sequence)`.
- Setup allocates storage before execution. The bounded event-commit path uses
  preallocated data, exact unsigned arithmetic and checked failure behavior.
- Source epochs and a closed logical frontier prevent late or old-session data
  from silently changing completed history. Duplicate and conflicting input have
  explicit outcomes.
- Work is preflighted before batch mutation. Budgets are recorded deterministic
  accounting units, not hardware clock counts. Once admitted, each event commits
  or receives a rejection receipt according to its source/system rules.
- The paired-publication integration primitive computes action and rewritten rule
  from the same old snapshot. Its new rule affects the next event. Real source
  profiles retain their own complete descriptions rather than using this tiny
  demonstration primitive as a substitute.
- Native profile instances retain all linear-memory bytes, sequence and source
  identities. Trapped or rejected native steps restore their complete pre-step
  state. External physical actions cannot be undone by software state rollback.
- Canonical serialization includes state, source epochs, frontier, module identities,
  queue and receipt chain. Full native memory participates in the state digest.

Determinism means identical admitted initial state, module bytes, typed inputs,
ordering, budgets and closure produce identical canonical results. Different live
telemetry is different input. A hash is a compact check of state, not a replacement
for the state bytes or the transcript needed to reconstruct them.

## The `.tecs` format

`docs/format.md` is the byte-level specification. The format has a 96-byte header,
64-byte section entries, explicit little-endian fields, source-profile fingerprints,
per-section SHA-256 and a root SHA-256. The loader enforces finite capacities,
versions, reserved bytes, offsets, lengths, source types and event rules.

The included `examples/tom_ecs_phone_v1.tecs` binds:

- Revision records for all ten public repositories.
- The original TOMK exact19 `.tmg` program and all eight compiled native profiles.
- Original 2,448-byte Q16 bitplanes and 153-byte log-net-D validity mask.
- Initial entities, typed component words, source epochs and a 24-event transcript.

The packaged local reference corpus has 132 cards covering all 59 pages of the
two supplied PDFs, the original 20 curated math/claim cards, all ten pinned public
repository READMEs, parsed dataset reference records and native profile contracts.
It is 319,245 bytes of JSON. Source excerpts and generated discussion retain
separate evidence labels. Identity fields are masked in the searchable derivative
text; original source hashes remain in provenance.

Its editable authoring form is `examples/tom_ecs_phone_v1.json`. Rebuild it with:

```bash
python3 tools/tom_ecs.py pack examples/tom_ecs_phone_v1.json \
  --out examples/tom_ecs_phone_v1.tecs
python3 tools/tom_ecs.py inspect examples/tom_ecs_phone_v1.tecs
./build/tom_ecs_replay examples/tom_ecs_phone_v1.tecs
```

The Python authoring tool emits canonical integer-only JSON metadata. The native
loader treats that metadata as opaque bytes, checks framing/hash limits, and does
not execute or authenticate its prose. Hashes provide integrity relative to known
bytes; they are not an author signature.

## Automorphic LUT and log-net-D

The supplied master document's finite arithmetic remains intact. Angles use
360,000,000,000 nanodegrees per turn. The D6 action consists of six rotations and
reflection, with exact group composition and index transformations.

The source scalar LUT has 17 radial rows and 72 angular columns. Its 1,158 valid
nodes and 66 invalid nodes are preserved. All 14,688 D6 node actions were checked
for equality of code and validity. This supports canonical orbit lookup for this
particular invariant scalar table. An orientation-sensitive vector or a different
sensor field needs its own equivariance rule; its direction cannot simply be
removed from the cache key.

The exact logarithmic level profile `2^k - 1` and the source Q16 companding profile
remain distinct. The C++ Q16 inverse helper is explicitly approximate floating
arithmetic; it is not used as the integer ECS consensus law. See
`docs/source-grounding.md` and `docs/math-validation.json` for PDF pages, source
hashes, numerical limitations and observed checks.

The Google-search PDF supplies project context and proposed directions. Its
statements about Codex internals, unlimited information or physical/radio behavior
are not treated as established engineering facts.

## Native execution, specialization and resource limits

The POCO X7 Pro is an ARM64 Android target with a Dimensity 8400-Ultra, Mali-G720,
LPDDR5X memory and UFS 4.0 storage according to Xiaomi's published specification.
The 12 GB physical RAM is shared with Android and other applications; current
available memory and thermal state matter more than the nominal number.

This app executes native machine code **within Android's process and sandbox**.
A normal APK does not own the boot chain, CPU scheduler, modem, kernel or all RAM.
The C/C++ core can be adapted to an independently specified embedded target, but
that would require a board/runtime/driver port and a separate build.

The retained arithmetic JIT emits a finite linear expression on x86_64/AArch64,
uses write-then-execute memory protection, self-checks, and falls back to the
interpreter when executable memory is unavailable. It is separate from the
integer consensus state and is not a general on-phone Clang/LLVM compiler.
TOMK's original `JIT1` opcode is seeded deterministic arithmetic in its source
language, a different operation from machine-code generation.

The eight default profiles retain 2,949,120 bytes of linear memory. Transactional
rollback uses another equal-sized buffer; module code, snapshots, arrays, Java,
Android and optional models require additional memory. The `.tecs` importer
limits packages to 16 MiB, eight native instances and 8 MiB of native linear
state. These explicit v1 profile bounds can be revised with measured device data.

No finite phone has zero latency or an infinite context buffer. Long-running
operation is supported by finite epochs, explicit replay and bounded retained
history. The current Android text store is capped at 10,000 records and 2 MiB of
text; retrieval supplies at most four keyword matches and 3,500 characters.
The optional decoder adapter uses a finite tokenizer/context window. Source
LUT symmetry does not create additional memory or eliminate network latency.

## Internet, telemetry and affordances

The app can use the phone's available network, including 5G. Public NOAA endpoints
supply Kp and current solar-wind observations through bounded HTTPS requests.
The app also enumerates available Android sensors, collects foreground readings,
and requests a one-shot location fix when selected. Collection pauses with the
Activity. Current sensor/history contents are local by default.

The Google button opens an explicit search query. The included Earth Engine
example addresses historical AHN3 terrain/surface layers and requires an
appropriately authorized Google project. There is no embedded Google or Hugging
Face secret, no universal live-data account, and no claim that an archived terrain
layer is a live sensor measurement.

`docs/topology-contract.md` separates topography, geographic adjacency, geometric
symmetry, mathematical/computational topology, sensor/network/model/memory/task/
compiler/time/hardware graphs. Each relationship needs its own type, units,
frame, timestamp, validity and permitted operation. The table is an extensible
contract; only the explicitly implemented graph operations are executable here.

## Build and verify on a workstation

Requirements: CMake 3.22+, a C99/C++20 compiler and Python 3 for package tools.
The default build includes vendored source kernels and runtime support; it does
not fetch model weights or invoke a network service.

```bash
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j 4
ctest --test-dir build --output-on-failure
./build/tom_ecs_replay examples/tom_ecs_phone_v1.tecs
python3 tests/staging_tests.py
```

Additional native oracle and bundle tests are documented in `native_modules/README.md`
and `tests/`. Observed validation results and environment details are stored with
the source. Host tests establish only what was run; Android compilation, APK
signing verification and actual phone execution are separate validation stages.

For Android:

```bash
cd android
./gradlew :app:assembleDebug
```

Pins: AGP 8.7.3, Gradle 8.9, JDK 17, SDK 35, build-tools 34.0.0, NDK
27.0.12077973, CMake 3.22.1, `arm64-v8a`, minimum Android API 29. A real pinned
Gradle wrapper is included. Keep machine paths, proxy settings and local keys
outside the distributable source tree.

## Optional language-model adapter

A decoder-only GGUF adapter from v0.1 remains available behind
`EDGE_AI_LLAMA_DIR`. It uses pinned llama.cpp revision
`e216f4ec8753e7317314e1ee01861b0230e583aa`. The default app contains the symbolic
native operators and a disabled status stub for this optional LLM backend; no
neural model weights were found in the audited personal repositories.

```bash
cmake -S . -B build-model -DCMAKE_BUILD_TYPE=Release \
  -DEDGE_AI_LLAMA_DIR=/absolute/path/to/pinned/llama.cpp
cmake --build build-model -j 2
./build-model/edge_ai_generate /absolute/path/model.gguf 'Your prompt' 128
```

Default inference limits are 4,096 context tokens, 128 output tokens, four CPU
threads and no GPU layers. Resource admission is an estimate, not proof that a
particular model will fit. Language output is displayed as data, not passed into
a shell or compiled as unrestricted source code.

## Source and license records

Original TOMK C code, bytecode and goldens are retained under
`ecs/vendor/tomk/` with its original MIT license. TNOMTOM original kernels,
recipes, notices and exact hashes are retained under `native_modules/` and
`provenance/huggingface/`; WABT runtime notices accompany its generated-code
support. The original repositories have different license terms. This package
preserves those notices and does not relicense all upstream material as MIT.

The user's personal identity details are not required as algorithm parameters or
network credentials. Upstream repository identifiers and original notices remain
in provenance where they identify the actual source.
