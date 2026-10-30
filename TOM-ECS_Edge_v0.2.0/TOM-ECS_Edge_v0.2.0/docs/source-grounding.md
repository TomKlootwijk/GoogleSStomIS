# Source grounding and numerical contract

## Evidence and implementation boundary

This project uses two supplied documents: **[LND]**, *log net D UNIVERSAL, Edition 2*, dated 30 October 2026, 50 pages; and **[SEARCH]**, the Google-search conversation export dated the same day, nine pages. Page references below refer to PDF pages, not the earlier report's internal appendix numbering. The current machine packet and qualified explanations in [LND] pages 3–21 define the numerical source. Earlier conversation excerpts are retained historical material, not implementation specifications.

`tools/import_lognet.py` extracts the named embedded ZIP, checks its manifest and mathematical data without executing embedded programs, and emits four unchanged binary payloads. `assets/lognet/provenance.json` records hashes and results; `source_metadata.json` preserves the center, rational radii, geometry, units, and lookup rules. `assets/documents/source_cards.json` provides concise source facts for model prompts, with page references and explicit evidence status.

The deliverable combines exact spatial primitives, a deterministic native ECS, pinned symbolic source operators, bounded retrieval, resource routing and a small native arithmetic JIT. These components have established mathematical and engineering foundations. Their arrangement is a project-specific implementation; the documents and tests do not establish a novel learning algorithm, general intelligence or performance superiority. Although neither supplied PDF gives a Hugging Face namespace, the subsequent public online search found `c0mbatduckzz`. Version 0.2 pins all eight public model repositories and two public datasets, and compiles selected TNOMTOM source profiles from seven underlying model families. See `provenance/huggingface/` and `native_modules/` for the separate online source audit and executable scope.

## Angles, words, and phase

One bit is one storage cell; wider quantities occupy multiple cells. The source uses MSB-first words, two's-complement signed fields, rational units, and symbolic pi coefficients. This is not a claim that arbitrary numbers or model weights fit in one bit. [LND, pp. 3–4]

Define `N = 360000000000` nanodegrees per turn. Latitude and longitude use signed 40-bit words, with latitude in `[-N/4, N/4]` and longitude in `[-N/2, N/2)`. Wrapped local angle theta uses 39 unsigned bits but rejects unused codes at or above N. Height uses signed 64-bit millimetres and requires height-kind and datum metadata. [LND, pp. 4–5]

Unwrapped phase is `Phi = winding*N + theta`, where winding is signed 32-bit. The derived phase needs 71 signed bits; a full C++ implementation should use a checked wider intermediate such as `__int128`. Six 60-degree orientation rotations restore the same orientation, while six phase advances accumulate a full turn. The current C++ subset implements wrapped D6 operations; phase/coordinate fixtures remain supplied data, not a claimed complete C++ geodesy library. [LND, p. 6]

## Automorphisms and the actual LUT

The dihedral group D6 has twelve elements. For `k` in 0..5, `b` in 0..1, and `s = 1-2*b`:

```text
g(theta) = (s*theta + k*N/6) mod N
(k,b) compose (l,c) = ((k+s*l) mod 6, b XOR c)
inverse(k,b) = ((-s*k) mod 6, b)
R(q,r) = (-r,q+r)
S(q,r) = (q+r,-r)
```

The axial action preserves `q*q + q*r + r*r`. An automorphism preserves a specified structure; changing coordinate representation or rotating a measured field does not automatically establish field invariance. [LND, p. 7]

The retained scalar fixture has 17 radial rows and 72 angular columns. Its 16 Q16 bitplanes occupy 2,448 bytes; its separate validity mask occupies 153 bytes. Bitplane order is plane, radial row, angular column, MSB first. The mask contains 1,158 valid nodes and 66 invalid nodes. Invalid zero and valid zero differ. The separate center has code 60627; the inner interval between zero and 0.5 mm is unrepresented. Default queries address exact nodes. [LND, p. 8; embedded metadata]

The index action is `j' = ((1-2*b)*j + 12*k) mod 72`. Independent enumeration verified code and mask equality for all 14,688 node actions. Seven angular orbits have representatives 0..6 and sizes `6,12,12,12,12,12,6`. Across 17 rows there are 119 representatives, 113 valid. This is a verified reduction for this scalar fixture. The supplied binaries preserve the full original representation; arbitrary telemetry and model tensors require their own equivariance or invariance argument.

## Two different logarithmic profiles

The additional exact-level table maps `k` in 0..63 to `2^k - 1`. Exact encoding accepts only these levels. Floor, ceil, and nearest with ties upward quantize other inputs. These six-bit level codes never reinterpret existing Q16 words. [LND, p. 9]

The Q16 fixture has normalized inverse:

```text
s_hat/s0 = 16^(q/65535) - 1
```

More generally, `L = ln(1+smax/s0)`, `u = ln(1+s/s0)/L`, and `q = floor((2^b-1)*u + 1/2)`. The inverse is `s_hat = s0*expm1(L*q/(2^b-1))`. Source code can evaluate a certified rational interval by integer-power comparisons. The C++ helper explicitly provides a floating-point approximation, not that certified interval algorithm. [LND, pp. 10, 15]

## What the checks establish

The independent importer checked 15 manifest entries, binary/JSON reconstruction, all D6 node actions, all 64 integer levels, and five coordinate frames including padding and phase consistency. A deliberate binary mutation was rejected. Separately, the inspected original bundle verifier passed 69 checks. `math-validation.json` records these observed results. Hash agreement establishes agreement with the supplied manifest, not independent authorship or a physical calibration certificate.

The data is synthetic; calibration and physical uncertainty are null. Nanodegree spacing is numerical resolution, not phone positioning accuracy. Log encoding cannot restore clipped or discarded information, and averaging log codes differs from averaging physical signals. A bounded disk display cannot store unlimited precision in a finite buffer. [LND, pp. 13, 15, 17]

[SEARCH, pp. 1–3] supplies themes such as structured ingestion, log-polar tables, and edge execution. It does not evidence “Queue 0-order,” inverse-log attention, or wave transforms as actual Codex internals. Its broader radio discussion does not establish compatible phone hardware or accessible Android APIs. Treat those sections as proposals requiring independent specification, not discovered device capabilities. [SEARCH, pp. 4–8]
