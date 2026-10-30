#include <edge_ai/llama_backend.hpp>
#include <iostream>
#include <stdexcept>
int main(int argc, char** argv) {
    if (argc < 3 || argc > 4) {
        std::cerr << "Usage: edge_ai_generate MODEL.gguf 'prompt' [max_tokens]\n"
                  << edge_ai::model_backend_status() << '\n';
        return 2;
    }
    try {
        edge_ai::GenerationOptions options;
        options.model_path = argv[1];
        options.prompt = argv[2];
        if (argc == 4) options.max_tokens = std::stoi(argv[3]);
        const auto output = edge_ai::generate(options);
        std::cout << output.text << '\n';
        std::cerr << "backend=" << output.backend << " prompt_tokens=" << output.prompt_tokens
                  << " generated_tokens=" << output.generated_tokens << " elapsed_ms=" << output.elapsed_ms << '\n';
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Generation unavailable: " << e.what() << '\n';
        return 1;
    }
}
