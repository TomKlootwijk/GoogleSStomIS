# Observed validation · v0.2.0

Validation date: 30 October 2026. The native test host is x86_64 Linux with
GCC 13.3.0. The Android build target is ARM64, minimum API 29, target API 35.

## Results

| Layer | Observed result | What the result establishes |
|---|---:|---|
| Existing mathematical/JIT/routing core | 20,685 checks passed | Finite source arithmetic, D6 validity/invariance, native specialization and routing regression cases |
| Native source kernels | 1,149 checks passed | Eight profiles, six kernels; full-memory equality with original Wasm for bootstrap and four events per profile, output/status equality, rollback and source limits |
| ECS and retained live session | 1,123 checks passed | Typed events, ordering, state/description timing, budgets, source identity, complete native authority, persistent state between observations and explicit thermal skip |
| AddressSanitizer + UBSan integration | 1,123 ECS checks passed | Instrumented C and C++ sources passed these finite cases; not a proof for every input |
| Adversarial binary packages | 79 checks passed | Invalid framing plus correctly rehashed malformed dimensions, events, programs, profile bindings and lifecycle cases |
| Instrumented binary packages | 79 checks passed | Same finite cases with sanitizer diagnostics treated as failures |
| Hugging Face staging helper | 7 tests passed | Revision/namespace/file/quota handling for the separate staging utility |
| Root CTest run | All five suites passed | Core, native source, ECS, package and staging suites completed in the final host build |
| Android clean build | All 39 Gradle tasks succeeded | Java, DEX, native ARM64 source, packaged assets and debug signing compiled |
| APK inspection | Passed | Signature, ABI, package/version, all 14 JNI exports, packaged source assets and native layout |

The eight native source profiles are compared with original pinned Wasm through
an independently running Node/WebAssembly oracle. Every byte of retained linear
memory participates in the comparison. This is conformance to the original
selected program, not an independent validation of physical interpretations.

The standalone native sanitizer attempt encountered a restricted `/proc` issue at
LeakSanitizer shutdown and is not claimed as a successful standalone run. The
separate integrated build instruments both C and C++ with AddressSanitizer and
UndefinedBehaviorSanitizer and passed the reported ECS/package tests. No general
leak-free or exhaustive-fuzzing claim is made.

## Final included package

`examples/tom_ecs_phone_v1.tecs` is 16,712 bytes. Its 24 events all apply, with zero
rejections, in the final example. Eight compiled native profiles are bound and
each advances two source events. Original C TOMK executes its published two-step
exact19 program. The source LUT and separately named paired-transition primitive
also execute.

Internal format root SHA-256 (the header digest field is zeroed for this hash):

```
9368ddec938bb08c232713345d11e30051196428b9156569f1647e6232f76f15
```

Complete file SHA-256:

```
9e30e4c48fbd2f53fbc10599a42921b60a8a2cd9babae4103e3ebddebad83e71
```

Final canonical ECS state SHA-256:

```
d6787877e1ba2ae204a91213d0bd8099d660ba344df00663af28bc5208b097b4
```

`examples/tom_ecs_phone_v1.expected.json` records the full observed report,
including every native profile's sequence, full-memory hash and source status.
The deterministic work total is 95,580 abstract units. These units are not CPU
instructions, clock cycles or a latency measurement.

## APK

The delivered APK is 3,321,189 bytes and has SHA-256:

```
df70e8f3d145bb8260458db2e3ee27c4c6a2a2a9bbeddff9da941668b45e5e92
```

Its package is `nl.lognetd.edge`, version `0.2.0`, version code 2. It carries a
normal local Android Debug certificate and a verified APK v2 signature. It does
not use the user's identity or a production signing key.

Both ARM64 shared libraries have 16 KiB ELF LOAD alignment and 16 KiB uncompressed
ZIP offsets. RELRO placement was inspected against Android's documented layout
rules. All 22 native compilation units have effective `-O2` optimization with
fast-math disabled and FP contraction off; required Wasm runtime flags remain.
The complete record is `android/build_verification.json`.

## Scope of device claims

No emulator or physical POCO was used to execute the APK. Successful compilation,
signing and layout checks do not establish actual installation, Android lifecycle
behavior, driver behavior, battery use, sustained speed, thermal response or
native executable-memory permission on the user's device.

The foreground session retains state while active. Stop, pause or process exit
releases it. The finite local text archive is not an automatic durable snapshot
and replay recovery system. Native source-domain limits remain active; for
example, the selected TK profile rejects its 257th step instead of silently
changing its mathematical clock or restarting itself.

## Evidence files

- `tests/core_validation.json` — retained v0.1 core test detail; the unchanged core suite was rerun in v0.2.
- `native_modules/tests/validation.json` and `golden.json` — source-native conformance.
- `tests/ecs_validation.json` — current native ECS and retained-session checks.
- `tests/bundle_validation.json` and `bundle_sanitizer_validation.json` — package adversaries.
- `provenance/huggingface/corpus_validation.json` — 132-card source corpus bounds and hashes.
- `android/build_verification.json` — final APK build, signing, ABI and asset evidence.
- `release/release_manifest.json` — delivered artifact identities and explicit execution status.
