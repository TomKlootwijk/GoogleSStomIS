#include <edge_ai/llama_backend.hpp>
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <fstream>
#include <limits>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <vector>
#ifdef EDGE_AI_WITH_LLAMA
#include "llama.h"
#endif

namespace edge_ai {
std::string model_backend_status() {
#ifdef EDGE_AI_WITH_LLAMA
    return "llama.cpp linked; compatible local GGUF required; CPU default";
#else
    return "Model backend disabled: rebuild with EDGE_AI_LLAMA_DIR set to pinned llama.cpp source";
#endif
}

GenerationResult generate(const GenerationOptions& o) {
    if (o.context_tokens < 256 || o.context_tokens > 8192 || o.max_tokens < 1 ||
        o.max_tokens > 1024 || o.max_tokens >= o.context_tokens || o.threads < 1 ||
        o.threads > 8 || o.gpu_layers < 0 || o.gpu_layers > 256 ||
        o.prompt.empty() || o.prompt.size() > 64 * 1024 || o.model_path.empty()) {
        throw std::invalid_argument("Invalid model path, prompt, or bounded generation settings");
    }
#ifndef EDGE_AI_WITH_LLAMA
    throw std::runtime_error(model_backend_status());
#else
    // The native runtime has global backend state; serialize this small reference
    // implementation. A production model pool should retain a loaded model.
    static std::mutex inference_mutex;
    std::lock_guard lock(inference_mutex);
    std::ifstream input(o.model_path, std::ios::binary);
    char magic[4]{};
    input.read(magic, 4);
    if (!input || std::string(magic, 4) != "GGUF")
        throw std::runtime_error("Selected file is not a readable GGUF model");
    const auto start = std::chrono::steady_clock::now();
    static std::once_flag initialized;
    std::call_once(initialized, [] { llama_backend_init(); });
    auto mp = llama_model_default_params();
    mp.n_gpu_layers = o.gpu_layers;
    using Model = std::unique_ptr<llama_model, decltype(&llama_model_free)>;
    Model model(llama_model_load_from_file(o.model_path.c_str(), mp), llama_model_free);
    if (!model) throw std::runtime_error("llama.cpp could not load this model or allocate its weights");
    if (llama_model_has_encoder(model.get()) || !llama_model_has_decoder(model.get()))
        throw std::runtime_error("This adapter supports text decoder-only models");
    const auto* vocab = llama_model_get_vocab(model.get());
    std::string formatted = o.prompt;
    bool used_template = false;
    if (const char* chat_template = llama_model_chat_template(model.get(), nullptr)) {
        const llama_chat_message message{"user", o.prompt.c_str()};
        int capacity = llama_chat_apply_template(chat_template, &message, 1, true, nullptr, 0);
        if (capacity < 0 || capacity > 128 * 1024)
            throw std::runtime_error("Model chat template is unsupported or exceeds prompt quota");
        std::vector<char> rendered(static_cast<std::size_t>(capacity) + 1);
        const int written = llama_chat_apply_template(chat_template, &message, 1, true,
                                                       rendered.data(), static_cast<int>(rendered.size()));
        if (written < 0 || written > capacity)
            throw std::runtime_error("Model chat-template rendering failed");
        formatted.assign(rendered.data(), static_cast<std::size_t>(written));
        used_template = true;
    }
    int needed = llama_tokenize(vocab, formatted.data(), static_cast<int>(formatted.size()),
                                nullptr, 0, true, used_template);
    if (needed == std::numeric_limits<int>::min())
        throw std::runtime_error("Tokenizer length overflow");
    if (needed < 0) needed = -needed;
    if (needed <= 0 || needed + o.max_tokens > o.context_tokens)
        throw std::runtime_error("Prompt plus output exceeds active context; retrieve less text");
    const int trained = llama_model_n_ctx_train(model.get());
    if (trained > 0 && needed + o.max_tokens > trained)
        throw std::runtime_error("Prompt plus output exceeds this model's trained context");
    std::vector<llama_token> prompt(static_cast<std::size_t>(needed));
    const int actual = llama_tokenize(vocab, formatted.data(), static_cast<int>(formatted.size()),
                                      prompt.data(), needed, true, used_template);
    if (actual != needed) throw std::runtime_error("Tokenizer returned an inconsistent length");
    auto cp = llama_context_default_params();
    cp.n_ctx = static_cast<std::uint32_t>(trained > 0 ? std::min(o.context_tokens, trained) : o.context_tokens);
    cp.n_batch = 128;
    cp.n_ubatch = 128;
    cp.n_threads = o.threads;
    cp.n_threads_batch = o.threads;
    using Context = std::unique_ptr<llama_context, decltype(&llama_free)>;
    Context ctx(llama_init_from_model(model.get(), cp), llama_free);
    if (!ctx) throw std::runtime_error("Could not allocate model context and KV cache");
    using Batch = std::unique_ptr<llama_batch_ext, decltype(&llama_batch_ext_free)>;
    Batch batch(llama_batch_ext_init(ctx.get()), llama_batch_ext_free);
    using Sampler = std::unique_ptr<llama_sampler, decltype(&llama_sampler_free)>;
    Sampler sampler(llama_sampler_init_greedy(), llama_sampler_free);
    if (!batch || !sampler) throw std::runtime_error("Could not allocate generation state");
    auto process = [&](const llama_token* tokens, int count, int position) {
        llama_batch_ext_clear(batch.get());
        for (int j = 0; j < count; ++j) {
            const int slot = llama_batch_ext_add_token(batch.get(), 0, tokens[j]);
            const llama_pos pos = position + j;
            if (slot < 0 || !llama_batch_ext_set_pos(batch.get(), slot, &pos))
                throw std::runtime_error("Invalid model token batch");
            if (j + 1 == count && !llama_batch_ext_set_output_logits(batch.get(), slot, true))
                throw std::runtime_error("Could not request model logits");
        }
        if (llama_process(ctx.get(), LLAMA_PROCESS_TYPE_DECODE, batch.get()) != 0)
            throw std::runtime_error("Model decode failed or exceeded runtime memory");
    };
    for (int offset = 0; offset < needed; offset += 128)
        process(prompt.data() + offset, std::min(128, needed - offset), offset);
    GenerationResult result;
    result.backend = o.gpu_layers == 0 ? "llama.cpp CPU" : "llama.cpp requested GPU offload; inspect backend logs";
    result.prompt_tokens = needed;
    for (int i = 0; i < o.max_tokens; ++i) {
        const llama_token next = llama_sampler_sample(sampler.get(), ctx.get(), -1);
        if (llama_vocab_is_eog(vocab, next)) break;
        std::vector<char> piece(256);
        int bytes = llama_token_to_piece(vocab, next, piece.data(), static_cast<int>(piece.size()), 0, false);
        if (bytes < 0) {
            if (bytes == std::numeric_limits<int>::min() || -bytes > 1024 * 1024)
                throw std::runtime_error("Token piece exceeds output quota");
            piece.resize(static_cast<std::size_t>(-bytes));
            bytes = llama_token_to_piece(vocab, next, piece.data(), static_cast<int>(piece.size()), 0, false);
        }
        if (bytes < 0 || result.text.size() + static_cast<std::size_t>(bytes) > 1024 * 1024)
            throw std::runtime_error("Generated text exceeds output quota");
        result.text.append(piece.data(), static_cast<std::size_t>(bytes));
        ++result.generated_tokens;
        if (i + 1 < o.max_tokens) process(&next, 1, needed + i);
    }
    result.elapsed_ms = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
    return result;
#endif
}
}
