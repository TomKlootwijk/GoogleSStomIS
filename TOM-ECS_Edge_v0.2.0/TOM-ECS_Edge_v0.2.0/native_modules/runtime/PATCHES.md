# WABT 1.0.42 embedding change

The original release archive is SHA-256 `84895407a6bbb80e918f33b16b2fb2206021c150b6bc9ff6f761263a745ab131`. Original runtime files are retained in `../upstream/wabt-runtime`; `source_manifest.json` compares original and embedded hashes.

One local change in `wasm-rt-mem-impl-helper.inc` changes the failed `calloc` branch from `abort()` to `wasm_rt_trap(WASM_RT_TRAP_EXHAUSTION)`. The C wrapper installs its trap target before instance creation, allowing failed allocation to return an error and release partial state. The admitted modules use fixed malloc-backed memory with at most 16 pages, so the other mmap and multiplication-overflow abort branches are not selected. Successful arithmetic and memory behavior is unchanged.

Build definitions select explicit bounds checks and disable mmap, signal handlers and Segue. No generated model C file is manually edited. Original Apache 2.0 attribution and license are preserved.
