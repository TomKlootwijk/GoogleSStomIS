# TOM-ECS Edge Android app

**An ARM64 debug APK was built successfully on 2026-10-30.** It contains the native
C++ ECS runtime, eight compiled source model profiles, the TOM-ECS/1 bundle loader,
the document-derived LUT, and a plain Java Activity. This is native code inside
Android's application sandbox. It does not replace Android, firmware, or the
phone's scheduler, and it does not claim the complete XD-ECS/11 host contract.

## Foreground live agent

**Start live agent and sensors** creates one retained native session with a phone
telemetry entity and eight compiled model instances. While the Activity remains
visible, observations advance explicit logical epochs without resetting those
model states. One request runs at a time, with at least one second after completion
before the next acquisition. Busy native work lowers the cadence; ticks do not
accumulate in a backlog.

Each epoch records available RAM, acceleration magnitude quantized to micro(m/s²),
acceleration validity, and Android thermal status. The compiled profiles retain
their own source-defined input ports; telemetry is not cast into model forces or
other quantities. The report exposes the observed inputs, admission decision,
applied/rejected events, source statuses/traps, and state/memory digests. Native
profile steps are admitted only with at least 256 MiB available RAM and thermal
status 0–2; unknown status or stronger thermal pressure skips those steps while
still recording the telemetry epoch.

**Reset** creates fresh model states from the pinned bootstrap. **Stop** releases
the session and stops sensors. Leaving the Activity also stops it; returning does
not silently resume. An already executing bounded native call may finish before
cleanup. Session state is in RAM; the finite text history keeps bounded reports,
not complete durable replay checkpoints. A report includes the replay contract,
but full automatic export/recovery of a long live session is not implemented.

The build and package checks are recorded in `build_verification.json`. No phone
or Android emulator was connected or used to run this APK. Native source tests on
the build host do not establish Android runtime behavior, performance, sensor
availability, executable-memory policy, or battery consumption.

## Use the included native models

The pinned public source inventory is `c0mbatduckzz` on Hugging Face: eight model
repositories and two dataset repositories. Eight admitted native profiles use six
source kernels compiled from their pinned WASM through WABT's `wasm2c`. These
operators are included in the default APK; they do not require a GGUF download,
Hugging Face login, or network access to run. See the root model/source inventory
for exact revisions, supported contracts, licenses, and exclusions.

The Activity provides four independent ways to inspect execution:

1. **Run the bundled TOM-ECS model and replay.** The app validates the binary
   bundle, executes its bounded recorded events, repeats execution from the same
   initial state, and shows the result, source fingerprints, event rejection count,
   and state digests. `ok: true` means package validation and repeat replay passed;
   inspect `rejected` separately for rejected events. A selected `.tecs` file can
   also be imported, up to 16 MiB, after native validation.
2. **Run a native profile.** Select one of the eight pinned profiles. The UI shows
   its source input type, units, byte count, clock, and scope. Supply exact input
   bytes as hexadecimal or leave the field empty to keep the profile's bootstrap
   input. Run 1–64 bounded source events. Explicit bytes apply to the first event
   only. Each tap creates a fresh instance; this screen is not a persistent agent
   training loop. Results show source/recipe/bootstrap fingerprints, projection,
   output, status, and the complete linear-memory SHA-256.
3. **Run a generated ECS fixture.** This is a reproducible test sequence controlled
   by the entered seed, explicitly separate from live sensor data.
4. **Capture phone integers and verify replay.** Start sensors and wait for an
   accelerometer measurement newer than two seconds. The acquisition boundary
   quantizes acceleration magnitude to micro-g and captures available RAM, thermal
   status, and a monotonic timestamp. The same captured integers are replayed in
   two fresh kernels. Equality applies to those recorded inputs; future live
   measurements and network arrivals are not deterministic.

Source profile input contracts are preserved. A phone reading or internet number
is not automatically a valid input for every symbolic model. The native profiles
are concrete compiled operators; this app does not claim that every feature of
their original runtime or every repository artifact has been ported.

## Device probes and local records

- The native arithmetic policy JIT reports its actual backend and interpreter
  fallback. Its executable-memory allocation queries the OS page size. The app
  also loads the hexagonal Q16 bitplanes and validity mask and checks D6 invariance.
- Runtime status shows Android memory availability/pressure, thermal state and
  headroom, network validation/metering, and the exposed sensor inventory.
- Accessible sensor listeners run at a requested 10 Hz while the Activity is
  visible. Android controls the actual rate. Unsupported one-shot and
  permission-protected sensors are skipped. Leaving the Activity stops listeners.
- Location permission is requested only after a tap, approximate access is
  accepted, and acquisition stops after one fix or a 20-second timeout. Location
  fixes are display-only.
- The app-private SQLite archive holds at most 10,000 records and 2 MiB of text,
  plus database/index/journal overhead. It evicts the oldest records. Individual
  entries are capped at 4 KiB; a stored report is not a full native state snapshot.
  At most one sensor summary per second is queued, with at most one pending sensor
  write while other work is busy.
- The packaged document/source cards are loaded from a JSON asset capped at 1 MiB.
  These local records retain source labels and qualification status. Optional
  language-model retrieval returns up to four keyword-matched entries, at most
  3,500 characters total. This is finite lexical retrieval, not infinite context
  or a semantic vector database. The compiled operators do not automatically read
  or reason over this text archive.
- **Search source documents offline** exposes this lexical lookup in the default
  APK without a language model. It restricts results to document/source cards,
  excludes measurement/hash reports, and displays source-labelled excerpts rather
  than generated answers. The packaged corpus contains 132 cards covering the
  supplied 59 PDF pages and pinned Hugging Face text/reference material.

The live loop starts after a tap and runs only in the foreground. Other model and
replay operations are individual tap-started requests. The Java worker serializes
the longer operations. There is no background service or arbitrary code executor.
One-shot ECS runs defer when Android reports low memory or less than 64 MiB available. The
bounded native event budget measures abstract work; it is not a hardware-cycle
reservation or real-time scheduling guarantee.

## Public internet inputs

The Google control opens an HTTPS search in the user's browser using only the
query typed into that field. Search results are not automatically ingested. No
Google API credentials are assumed or bundled.

Two refresh controls request fixed public NOAA endpoints. Requests contain no
phone measurements or location, reject redirects, and run on the worker thread.
Connect/read timeouts are eight seconds; a 15-second elapsed deadline is checked
between reads. A blocking read can outlast that deadline by up to its timeout.
There is no automatic polling or sensor upload.

| Feed | Source and limits |
|---|---|
| Planetary Kp | `https://services.swpc.noaa.gov/json/planetary_k_index_1m.json`; response cap 64 KiB. An estimated geomagnetic index from ground magnetometers. |
| Spacecraft solar wind | `https://services.swpc.noaa.gov/json/rtsw/rtsw_wind_1m.json`; response cap 4 MiB. Spacecraft-derived measurements distributed over the internet. |

Solar-wind parsing uses NOAA's current object-record schema and the latest parsed
`active: true` row containing a usable proton measurement. It displays spacecraft
source, density in cm^-3, speed in km/s, temperature in K, the raw overall-quality
code, and observation/receipt times in UTC. `active` is the forecaster-selected
primary source, not a quality guarantee. Missing, nonfinite, negative, or broadly
implausible values are unavailable rather than zero. App sanity maxima are
100,000 cm^-3, 5,000 km/s, and 1e9 K; these are bounds, not scientific calibration.
The one-hour freshness threshold is app policy, not a provider guarantee.

The older `products/solar-wind/plasma-5-minute.json` endpoint returned 404 during
verification. NOAA's Service Change Notice 26-21 describes its replacement. A
historical three-record sample and retrieval metadata in `tests/fixtures` document
one verified response; they are not packaged as live fallback data. Actual Android
HTTP/parser behavior still needs device validation. The phone does not establish
an uplink to a satellite. These downloads do not automatically drive native
profile ports or the deterministic ECS state.

## Optional GGUF language-model adapter

The default APK's separate GGUF backend is disabled. This does not disable the
compiled symbolic model profiles described above. To enable the optional
llama.cpp adapter, obtain the source revision in the root dependency lock and
build with its absolute local path:

```bash
./gradlew :app:assembleDebug -PedgeAiLlamaDir=/absolute/path/to/llama.cpp
```

Import a compatible, licensed GGUF through Android's document picker. The app
copies it into private storage after checking its magic, a 4 GiB file cap, and
available disk space. Import success does not prove architecture compatibility or
RAM fit. Immediately before inference, the app checks thermal state and requires
Android to report no memory pressure and free RAM at least the file size plus
1 GiB. This is an admission estimate, not a guarantee that every model's weights,
KV cache, and scratch allocations fit.

The adapter uses a 4,096-token context, at most 128 output tokens, four CPU threads,
and zero GPU layers. Excessively long tokenized prompts fail. Reference snippets
are labelled as untrusted data, and generated text is displayed rather than
executed; delimiters do not establish prompt-injection immunity. This version has
no streaming or in-flight native cancellation API. A bounded native request may
finish after the Activity is left; Android may terminate the process.

## Build and install

| Component | Pinned build value |
|---|---|
| Android Gradle Plugin | 8.7.3 |
| Gradle / included Wrapper | 8.9; distribution SHA-256 checked |
| JDK | 17; authoring build used Temurin 17.0.21+9 |
| Compile/target SDK | 35 |
| Minimum SDK | 29 |
| Build Tools | 34.0.0 |
| NDK | 27.0.12077973 |
| SDK CMake | 3.22.1 |
| Native ABI | arm64-v8a |
| Application ID / version | `nl.lognetd.edge` / `0.2.0` (code 2) |

This is a documented compatibility set, not a claim to use the newest toolchain
or satisfy every current Play publication requirement. Normal official SDK
installation and license acceptance were completed for the local build. No
account registration, Play publishing, release signing identity, device rooting,
or phone installation was performed.

With JDK 17 and Android's command-line tools installed, configure `ANDROID_HOME`
to your SDK, then run from the project root:

```bash
sdkmanager 'platforms;android-35' 'build-tools;34.0.0' \
  'ndk;27.0.12077973' 'cmake;3.22.1'
cd android
./gradlew :app:assembleDebug
```

The included wrapper downloads the pinned Gradle distribution on first use.
Android Studio may create `local.properties` for local SDK paths; do not distribute
that file. Successful output is `app/build/outputs/apk/debug/app-debug.apk`.
The build is signed with a local development debug certificate, not the user's
identity, and is not a release publication build. Native targets use `-O2` in
Debug while preserving strict FP options and disabling fast-math. Flexible-page
support and explicit 16 KiB max/common page-size linker flags are enabled. The
packaged ELF LOAD/RELRO and ZIP alignment were inspected; on-device 16 KiB behavior
remains a runtime test.

To install the supplied debug APK on your own connected phone using the normal
Android developer/USB-debugging flow:

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

The application ID matches the prior source version for continuity. Android may
reject an update signed with a different debug key. Preserve any needed local
app data before choosing to uninstall an earlier install. No update bypass is
implemented.

JNI links `edge_ai_core`, `edge_ai_ecs`, `edge_ai_bundle`, `edge_native_modules`, and
`edge_ai_model`. CMake resolves the project root five directories above
`app/src/main/cpp`. The configured asset source is `../assets` relative to this
Android directory, so APK paths include `tom_ecs_phone_v1.tecs`,
`documents/source_cards.json`, `lognet/hex_q16_bitplanes.bin`, and
`lognet/hex_validity_bits.bin`.

## Device validation still needed

Install and launch on the actual POCO firmware, run the built-in bundle and all
native profiles, then check source types, rejection counts, and replay equality.
Confirm numeric JIT or its reported fallback. Test sensor lifecycle and location
permissions, connectivity errors and both NOAA feeds, app restart and archive
limits. Measure native latency, peak RAM, thermal behavior, and battery use before
choosing longer event sequences. No GPU/NPU acceleration, sustained speed,
reliability guarantee, or real-time deadline is asserted by this build.

## Primary references

- [POCO X7 Pro specifications](https://www.po.co/global/product/poco-x7-pro/specs/)
- [Android sensors](https://developer.android.com/develop/sensors-and-location/sensors/sensors_overview)
- [Android PowerManager](https://developer.android.com/reference/android/os/PowerManager)
- [Android network state](https://developer.android.com/develop/connectivity/network-ops/reading-network-state)
- [Android location permissions](https://developer.android.com/develop/sensors-and-location/location/permissions)
- [Android app sandbox](https://source.android.com/docs/security/app-sandbox)
- [Android 16 KiB page support and verification](https://developer.android.com/guide/practices/page-sizes)
- [AGP 8.7 compatibility](https://developer.android.com/build/releases/agp-8-7-0-release-notes)
- [Gradle 8.9](https://docs.gradle.org/8.9/release-notes.html)
- [Android SDK Manager](https://developer.android.com/tools/sdkmanager)
- [llama.cpp Android build](https://github.com/ggml-org/llama.cpp/blob/master/docs/android.md)
- [NOAA Kp explanation](https://www.spaceweather.gov/products/planetary-k-index)
- [NOAA solar-wind explanation](https://www.spaceweather.gov/products/solar-wind)
- [NOAA Service Change Notice 26-21](https://www.weather.gov/media/notification/pdf_2026/scn26-21_Data_Format_Changes_Impacting_SWPC_Products.pdf)

Sources were consulted on 2026-10-30. Public feeds and Android device capabilities
can change; device validation is still required.
