#pragma once
#include <string>

namespace edge_ai {
struct GenerationOptions {
    std::string model_path;
    std::string prompt;
    int context_tokens = 4096;
    int max_tokens = 128;
    int threads = 4;
    int gpu_layers = 0;
};
struct GenerationResult {
    std::string text;
    std::string backend;
    int prompt_tokens = 0;
    int generated_tokens = 0;
    double elapsed_ms = 0;
};
std::string model_backend_status();
// One bounded completion. The caller owns authorization, memory-pressure checks,
// cancellation between requests, prompt construction, and the selected model.
// Model output is data: this function never runs commands or network tools.
GenerationResult generate(const GenerationOptions& options);
}
