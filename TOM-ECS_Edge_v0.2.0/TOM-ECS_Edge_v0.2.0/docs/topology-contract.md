# Topology, affordances, and time-indexed state

## Separate meanings of “topo”

The proposed runtime represents several kinds of relationships. They share typed graph storage where useful, but retain different meanings, units, and permitted operations. No finite list covers every mathematical use of “topology”; this contract covers the meanings relevant to the requested phone agent. The table is a design extension, not a formula recovered from the documents.

| Domain | Nodes and relations | Required interpretation |
|---|---|---|
| Topography | Terrain samples, contours, elevation cells | Horizontal CRS, vertical datum, resolution, observation date; height is not graph depth. |
| Geographic topology | Places, tracks, regions; inside, overlaps, adjacent | Coordinates and topology are separate. Adjacency needs an explicit tolerance and boundary rule. |
| Geometric symmetry | Hexagonal nodes and D6 transforms | Preserve the declared lattice or code field; record how vectors transform. |
| Mathematical topology | Spaces, neighborhoods, continuity, connected components | State the topology and the map. A visual resemblance does not prove a homeomorphism. |
| Computational topology | Complexes, filtration levels, persistent features | Record the metric, scale, construction, and uncertainty; no persistent-homology implementation is claimed. |
| Sensor topology | Devices, channels, calibration and synchronization links | Availability comes from Android enumeration. A channel name does not establish hardware support. |
| Network topology | Device, permitted endpoint, broker, cache, link | Reachability, authentication, latency, metering, and freshness are independent attributes. |
| Model topology | Tensor operators, layers, adapters, input/output types | Model architecture, tokenizer, format, revision, and supported backend determine compatibility. |
| Memory topology | Events, documents, chunks, summaries, citations | Retrieval edges indicate relevance or provenance, not guaranteed complete recall. |
| Task topology | Goals, dependencies, preconditions, actions, results | Topological ordering applies to an acyclic dependency graph; loops need explicit state. |
| Compiler topology | Typed expressions, dependencies, compiled variants | Dataflow validity and code-generation scope remain distinct from spatial geometry. |
| Temporal topology | Sessions, ordered events, intervals, causal links | Monotonic processing order, wall-clock time, exposure intervals, and inferred causality differ. |
| Hardware topology | CPU cores, GPU queues, memory regions, thermal domains | Shared memory still needs synchronization and measured budgets; clocks alone do not determine throughput. |

Cross-domain edges must declare their meaning: `measured_at`, `derived_from`, `expressed_in_frame`, `depends_on`, `reachable_via`, `implemented_by`, `authorized_for`, or `valid_during`. An untyped “connected to” edge cannot justify a conversion, permission, or physical inference.

## Typed observation and affordance records

A proposed observation envelope carries a source/channel ID, sequence, monotonic timestamp, UTC timestamp when known, units, frame/CRS, calibration revision, uncertainty, validity, origin, and privacy scope. Keep missing information distinct from zero. Derived observations retain source references and transformation versions. The supplied coordinate payload already distinguishes latitude, local angle, phase, height, and validity; this envelope extends that principle to heterogeneous phone data. [LND, pp. 3–6, 11–13]

An affordance is an available operation with typed input/output, prerequisites, permissions, expected latency, memory, energy, freshness, and failure behavior. Examples include reading an enumerated accelerometer, looking up a valid LUT node, invoking an installed compatible model, or requesting a configured HTTPS service. Affordance discovery does not grant permission or establish an endpoint's reliability.

Model weights, retrieved documents, telemetry, and executable kernels remain different object types. A dataset can supply retrieval evidence or an explicitly prepared training input; it does not become a running model by being downloaded. A named Hugging Face repository needs a revision and format/backend check before activation. “All models” means an inventory and selection problem, not simultaneous loading within 12 GB.

## Proposed D(t) state

The documents do not supply a dynamic AI law named D(t). This project uses the name for an explicitly proposed bounded state:

```text
D(t) = (E(t), G(t), L(t), M(t), P(t), B(t), V(t))
E: retained observations and retrieval selections
G: typed relations and available affordances
L: exact source tables and validated cache entries
M: installed model metadata and active backend
P: permissions and data-use policy
B: measured memory, thermal, network, and work budgets
V: source, model, policy, and kernel revisions
```

An event updates the state through a checked transition `D(t+1) = F(D(t), event)`. Eligible actions satisfy prerequisites and budgets before a utility rule selects one. The current C++ router uses fixed, disclosed heuristic weights; it does not learn them or prove an optimal policy. The arithmetic JIT specializes a bounded linear score. It is not an on-phone general C++ source compiler or a self-modifying language model.

The full typed graph above is a specification for expansion. Version 0.2 implements a bounded deterministic ECS with typed source profiles, finite retained state and replay, guarded route selection, source LUT operations, limited arithmetic JIT, and optional language-model adapters. It does not implement every graph domain as a live service. The executable ECS transition law is specified in `format.md`; `D(t)` here is an application-level grouping, not a replacement for the source TNOMTOM state `S=(E,H,P,xi,b,F,O,C)`. In particular, source address hierarchy H remains distinct from geometric state P.

## Automorphic caching without losing meaning

Use an orbit representative only when the result is invariant under the declared action. For an equivariant operation, retain the group element and transform the result back to the original frame. For an orientation-sensitive operation without either property, keep orientation in the key. This prevents a valid scalar-table symmetry from silently erasing direction in location, camera, or motion data. [LND, pp. 7–8]

Dispatch cache keys include the modeled request, source/model/policy revisions, backend state, permission flags, and resource inputs. Cached eligibility is rechecked. Cached routing decisions are not cached truth about a changing external world. Fresh observations additionally require observation timestamps, expiry, and source status.

## Finite operating limits

Long-running history can grow on storage under a retention policy while the model receives a finite selection. Retrieval and summaries trade completeness for available memory, context, and latency. Logarithmic coordinates, LUTs, and symmetry do not create an infinite token window. The source itself distinguishes finite representation from bounded mathematical display. [LND, p. 17]

Useful throughput depends on memory capacity and bandwidth, storage, model context/KV memory, thermal throttling, battery, sensor rates, Android permissions, network latency, metering, service quotas, and data freshness. A 5G link does not replace unavailable sensor hardware or make archived geospatial data live. Budget these independently; measure performance on the actual phone before claiming real-time behavior.
