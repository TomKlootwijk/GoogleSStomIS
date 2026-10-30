#include <jni.h>
#include <edge_ai/core.hpp>
#include <edge_ai/llama_backend.hpp>
#include <edge_ai/ecs.hpp>
#include <edge_ai/bundle.hpp>
#include <edge_ai/live_session.hpp>
#include <tnm_native.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
#include <array>
#include <cmath>
#include <exception>
#include <fstream>
#include <mutex>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

namespace {
std::mutex bridge_mutex;
std::mutex model_mutex;
std::mutex ecs_mutex;
std::unique_ptr<edge_ai::ecs::LiveSession> live_session;
std::uint64_t live_generation = 0;
edge_ai::Runtime& runtime() {
    static edge_ai::Runtime instance;
    return instance;
}
jstring result(JNIEnv* env, const std::string& value) {
    // Model output is UTF-8, not JNI modified UTF-8. Decode with Java's UTF-8 decoder.
    jbyteArray bytes = env->NewByteArray(static_cast<jsize>(value.size()));
    if (!bytes) return nullptr;
    env->SetByteArrayRegion(bytes, 0, static_cast<jsize>(value.size()),
                           reinterpret_cast<const jbyte*>(value.data()));
    jclass string_class = env->FindClass("java/lang/String");
    jmethodID constructor = env->GetMethodID(string_class, "<init>", "([BLjava/lang/String;)V");
    jstring charset = env->NewStringUTF("UTF-8");
    auto converted = static_cast<jstring>(env->NewObject(string_class, constructor, bytes, charset));
    env->DeleteLocalRef(bytes);
    env->DeleteLocalRef(charset);
    env->DeleteLocalRef(string_class);
    return converted;
}
std::string string_from_java(JNIEnv* env, jstring value) {
    if (!value) return {};
    jclass string_class = env->FindClass("java/lang/String");
    jmethodID get_bytes = env->GetMethodID(string_class, "getBytes", "(Ljava/lang/String;)[B");
    jstring charset = env->NewStringUTF("UTF-8");
    auto bytes = static_cast<jbyteArray>(env->CallObjectMethod(value, get_bytes, charset));
    env->DeleteLocalRef(charset);
    env->DeleteLocalRef(string_class);
    if (!bytes || env->ExceptionCheck()) return {};
    std::string copy(static_cast<std::size_t>(env->GetArrayLength(bytes)), '\0');
    env->GetByteArrayRegion(bytes, 0, static_cast<jsize>(copy.size()), reinterpret_cast<jbyte*>(copy.data()));
    env->DeleteLocalRef(bytes);
    return copy;
}
std::vector<std::uint8_t> asset_bytes(AAssetManager* manager, const char* name,
                                    std::size_t maximum = 2 * 1024 * 1024) {
    AAsset* asset = AAssetManager_open(manager, name, AASSET_MODE_BUFFER);
    if (!asset) throw std::runtime_error(std::string("Missing asset: ") + name);
    const auto length = AAsset_getLength64(asset);
    if (length < 0 || static_cast<std::uint64_t>(length) > maximum) {
        AAsset_close(asset);
        throw std::runtime_error("LUT asset size out of bounds");
    }
    std::vector<std::uint8_t> bytes(static_cast<std::size_t>(length));
    std::size_t offset = 0;
    while (offset < bytes.size()) {
        int count = AAsset_read(asset, bytes.data() + offset, bytes.size() - offset);
        if (count <= 0) { AAsset_close(asset); throw std::runtime_error("Incomplete LUT asset read"); }
        offset += static_cast<std::size_t>(count);
    }
    AAsset_close(asset);
    return bytes;
}
}  // namespace

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_startLiveSession(JNIEnv* env, jclass, jlong generation) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        if (generation <= 0 || static_cast<std::uint64_t>(generation) <= live_generation)
            throw std::invalid_argument("Stale live-session generation");
        auto next = std::make_unique<edge_ai::ecs::LiveSession>();
        live_session = std::move(next);
        live_generation = static_cast<std::uint64_t>(generation);
        return result(env, "{\"ok\":true,\"status\":\"started\",\"epoch\":0}");
    } catch (const std::exception& error) {
        return result(env, std::string("Live session start failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_observeLiveSession(JNIEnv* env, jclass, jlong generation,
        jlong available, jlong acceleration, jboolean valid, jint thermal) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        if (!live_session || generation <= 0 ||
                static_cast<std::uint64_t>(generation) != live_generation)
            throw std::invalid_argument("Live session was stopped or replaced");
        const auto thermal_code = thermal >= 0 ? static_cast<std::uint32_t>(thermal) : UINT32_MAX;
        return result(env, live_session->observe_json(
            available > 0 ? static_cast<std::uint64_t>(available) : 0,
            static_cast<std::int64_t>(acceleration), valid == JNI_TRUE, thermal_code));
    } catch (const std::exception& error) {
        return result(env, std::string("Live observation failed: ") + error.what());
    }
}

extern "C" JNIEXPORT void JNICALL
Java_nl_lognetd_edge_NativeBridge_stopLiveSession(JNIEnv*, jclass, jlong generation) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    if (generation > 0 && static_cast<std::uint64_t>(generation) == live_generation)
        live_session.reset();
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_runEcsFixture(JNIEnv* env, jclass, jlong seed) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        if (seed < 0) throw std::invalid_argument("Seed must be nonnegative");
        return result(env, edge_ai::ecs::run_fixture_json(static_cast<std::uint64_t>(seed)));
    } catch (const std::exception& error) {
        return result(env, std::string("ECS fixture failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_inspectBuiltinBundle(JNIEnv* env, jclass, jobject assets) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        AAssetManager* manager = AAssetManager_fromJava(env, assets);
        if (!manager) throw std::runtime_error("Android asset manager unavailable");
        const auto bytes = asset_bytes(manager, "tom_ecs_phone_v1.tecs", 16 * 1024 * 1024);
        return result(env, edge_ai::bundle::inspect_and_replay_json(bytes));
    } catch (const std::exception& error) {
        return result(env, std::string("Bundled TOM-ECS model unavailable: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_inspectBundle(JNIEnv* env, jclass, jstring path) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        const auto local_path = string_from_java(env, path);
        if (env->ExceptionCheck()) return nullptr;
        std::ifstream input(local_path, std::ios::binary | std::ios::ate);
        if (!input) throw std::runtime_error("Could not open the selected TOM-ECS bundle");
        const auto size = input.tellg();
        if (size <= 0 || size > 16 * 1024 * 1024)
            throw std::runtime_error("Bundle exceeds the 16 MiB limit or is empty");
        std::vector<std::uint8_t> bytes(static_cast<std::size_t>(size));
        input.seekg(0);
        if (!input.read(reinterpret_cast<char*>(bytes.data()), static_cast<std::streamsize>(bytes.size())))
            throw std::runtime_error("Incomplete TOM-ECS bundle read");
        return result(env, edge_ai::bundle::inspect_and_replay_json(bytes));
    } catch (const std::exception& error) {
        return result(env, std::string("TOM-ECS bundle failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_replayPhoneSnapshot(JNIEnv* env, jclass,
        jlong acceleration_micro_g, jlong available_bytes, jint thermal_status,
        jlong acquired_monotonic_nanos) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        if (acceleration_micro_g < 0 || acceleration_micro_g > 10000000000LL
                || available_bytes < 0 || acquired_monotonic_nanos < 0
                || thermal_status < -1 || thermal_status > 6)
            throw std::invalid_argument("Phone snapshot values are out of the declared schema range");
        edge_ai::ecs::Config config;
        config.entity_capacity = 4;
        config.component_count = 3;
        config.event_capacity = 8;
        config.source_capacity = 2;
        const std::string contract = "TOM-ECS/1:android-snapshot-v1:acceleration_micro_g,available_bytes,thermal_status_plus_one";
        config.contract_digest = edge_ai::ecs::sha256(std::span<const std::uint8_t>(
                reinterpret_cast<const std::uint8_t*>(contract.data()), contract.size()));
        const std::array<std::uint64_t,3> inputs{
            static_cast<std::uint64_t>(acceleration_micro_g),
            static_cast<std::uint64_t>(available_bytes),
            static_cast<std::uint64_t>(thermal_status + 1)};
        auto execute = [&]() {
            edge_ai::ecs::Kernel kernel(config);
            const auto entity = kernel.create_entity();
            kernel.set_source_epoch(1,0);
            for (std::uint16_t component = 0; component < inputs.size(); ++component)
                kernel.set_component(entity, component, 0);
            for (std::uint16_t component = 0; component < inputs.size(); ++component) {
                edge_ai::ecs::Event event;
                event.logical_tick = 1;
                event.source_id = 1;
                event.source_epoch = 0;
                event.sequence = component + 1;
                event.target = entity;
                event.opcode = edge_ai::ecs::Opcode::Set64;
                event.component = component;
                event.argument = inputs[component];
                if (kernel.enqueue(event) != edge_ai::ecs::Status::Ok)
                    throw std::runtime_error("Captured event was not admitted");
            }
            edge_ai::ecs::Capabilities capabilities;
            capabilities.allowed = edge_ai::ecs::Mutate;
            edge_ai::ecs::WorkBudget budget;
            budget.max_events = 3;
            budget.max_operations = 128;
            const auto report = kernel.commit_through(1, capabilities, budget);
            if (report.status != edge_ai::ecs::Status::Ok || report.applied != 3)
                throw std::runtime_error("Captured event commit failed");
            return edge_ai::ecs::hex_digest(kernel.state_sha256());
        };
        const auto first = execute();
        const auto replay = execute();
        std::ostringstream report;
        report << "{\"ok\":" << (first == replay ? "true" : "false")
               << ",\"kind\":\"captured_phone_snapshot\",\"acquired_monotonic_ns\":" << acquired_monotonic_nanos
               << ",\"captured_inputs\":{\"acceleration_micro_g\":" << inputs[0]
               << ",\"available_memory_bytes\":" << inputs[1]
               << ",\"thermal_status_plus_one\":" << inputs[2]
               << "},\"logical_tick\":1,\"event_count\":3,\"max_operations\":128"
               << ",\"state_sha256\":\"" << first << "\",\"replay_sha256\":\"" << replay
               << "\",\"replay_equal\":" << (first == replay ? "true" : "false")
               << ",\"meaning\":\"Live acquisition varies; replay uses the same captured integer inputs. No actuator or network command runs.\"}";
        return result(env, report.str());
    } catch (const std::exception& error) {
        return result(env, std::string("Phone snapshot replay failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_nativeProfiles(JNIEnv* env, jclass) {
    const char* profiles = tnm_profiles_json();
    return result(env, profiles ? profiles : "[]");
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_runNativeProfile(JNIEnv* env, jclass, jstring id,
                                                jstring input_hex, jint steps) {
    std::lock_guard<std::mutex> lock(ecs_mutex);
    try {
        const auto selected = string_from_java(env,id);
        const auto input = string_from_java(env,input_hex);
        if (env->ExceptionCheck()) return nullptr;
        if (steps < 1 || steps > TNM_RUN_MAX_STEPS || input.size() > 2 * 2064)
            throw std::invalid_argument("Native profile request is outside the event/input limits");
        std::array<char,16384> output{};
        const int code = tnm_run_json(selected.c_str(),input.c_str(),
                                     static_cast<std::uint32_t>(steps),output.data(),output.size());
        if (output[0] == '\0')
            throw std::runtime_error("Native profile returned code " + std::to_string(code) + " without a report");
        return result(env,std::string(output.data()));
    } catch (const std::exception& error) {
        return result(env,std::string("Native profile failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_describe(JNIEnv* env, jclass, jlong available,
        jlong monotonic, jboolean internet, jboolean metered, jboolean severe) {
    std::lock_guard<std::mutex> lock(bridge_mutex);
    try {
        edge_ai::Request request;
        request.source_revision = "android-capability-probe-v1";
        edge_ai::Conditions conditions;
        conditions.available_memory_bytes = available > 0 ? static_cast<std::uint64_t>(available) : 0;
        conditions.monotonic_ms = monotonic > 0 ? static_cast<std::uint64_t>(monotonic) : 0;
        conditions.internet = internet;
        conditions.metered = metered;
        conditions.thermal_severe = severe;
        const auto decision = runtime().choose(request, conditions);
        std::ostringstream status;
        status << "Numeric policy backend: " << runtime().jit_backend()
               << "\nCapability probe route: " << edge_ai::route_name(decision.route)
               << "\nReason: " << decision.reason
               << "\nRoute cache entries: " << runtime().cache_size();
        if (!runtime().jit_fallback_reason().empty())
            status << "\nJIT fallback: " << runtime().jit_fallback_reason();
        status << "\nThis probe chooses a route; it does not call an external service.";
        return result(env, status.str());
    } catch (const std::exception& error) {
        return result(env, std::string("Native runtime error: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_evaluateMotion(JNIEnv* env, jclass, jdouble acceleration) {
    std::lock_guard<std::mutex> lock(bridge_mutex);
    try {
        if (!std::isfinite(acceleration)) return result(env, "Invalid accelerometer measurement.");
        edge_ai::LinearJit scorer({1.0}, 0.0);
        std::array<double, 1> features{acceleration};
        double output = scorer.evaluate(features);
        std::ostringstream report;
        report << "Measured accelerometer magnitude: " << acceleration << " g"
               << "\nCompiled numeric expression: y = 1.0 * x + 0.0"
               << "\nResult: " << output
               << "\nBackend: " << scorer.backend_name()
               << "\nA bounded arithmetic JIT demonstration; not a general C++ source compiler.";
        if (!scorer.fallback_reason().empty()) report << "\nFallback: " << scorer.fallback_reason();
        return result(env, report.str());
    } catch (const std::exception& error) {
        return result(env, std::string("Numeric evaluation failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_modelBackendStatus(JNIEnv* env, jclass) {
    return result(env, edge_ai::model_backend_status());
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_generate(JNIEnv* env, jclass, jstring path,
                                        jstring prompt, jint max_tokens) {
    // A long model call must never hold the capability/JIT lock used by the UI.
    std::lock_guard<std::mutex> lock(model_mutex);
    try {
        edge_ai::GenerationOptions options;
        options.model_path = string_from_java(env, path);
        options.prompt = string_from_java(env, prompt);
        options.context_tokens = 4096;
        options.max_tokens = max_tokens > 0 && max_tokens <= 128 ? max_tokens : 128;
        options.threads = 4;
        if (env->ExceptionCheck()) return nullptr;
        const auto generation = edge_ai::generate(options);
        std::ostringstream report;
        report << generation.text << "\n\n[Local backend: " << generation.backend
               << "; prompt tokens: " << generation.prompt_tokens
               << "; generated tokens: " << generation.generated_tokens
               << "; elapsed: " << generation.elapsed_ms << " ms]";
        return result(env, report.str());
    } catch (const std::exception& error) {
        return result(env, std::string("Model generation failed: ") + error.what());
    }
}

extern "C" JNIEXPORT jstring JNICALL
Java_nl_lognetd_edge_NativeBridge_inspectLut(JNIEnv* env, jclass, jobject assets) {
    try {
        AAssetManager* manager = AAssetManager_fromJava(env, assets);
        if (!manager) return result(env, "Android assets unavailable.");
        const auto planes = asset_bytes(manager, "lognet/hex_q16_bitplanes.bin");
        const auto validity = asset_bytes(manager, "lognet/hex_validity_bits.bin");
        const auto lut = edge_ai::HexLut::decode(planes, validity);
        std::ostringstream status;
        status << "Document-derived Q16 LUT loaded: " << lut.valid_count()
               << " valid samples\nD6 invariance verified: " << (lut.invariant() ? "yes" : "no")
               << "\nLUT symmetry applies to this supplied function, not every phone measurement.";
        return result(env, status.str());
    } catch (const std::exception& error) {
        return result(env, std::string("Document LUT unavailable: ") + error.what());
    }
}
