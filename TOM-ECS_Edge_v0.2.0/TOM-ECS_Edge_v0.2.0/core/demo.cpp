#include "edge_ai/core.hpp"
#include <array>
#include <iostream>

int main(int argc, char** argv) {
  try {
    const std::string assets = argc > 1 ? argv[1] : "assets/lognet";
    const auto lut = edge_ai::HexLut::load(assets + "/hex_q16_bitplanes.bin",
                                         assets + "/hex_validity_bits.bin");
    edge_ai::Runtime runtime;
    edge_ai::Request request;
    edge_ai::Conditions conditions;
    conditions.monotonic_ms = 1000;
    const auto result = runtime.choose(request,conditions);
    const auto sample = lut.canonical_sample(0,37);
    std::cout << "{\n  \"prototype\": \"lognet-edge-v0.1\",\n"
              << "  \"jit_backend\": \"" << runtime.jit_backend() << "\",\n"
              << "  \"d6_invariant\": " << (lut.invariant() ? "true" : "false") << ",\n"
              << "  \"valid_lut_nodes\": " << lut.valid_count() << ",\n"
              << "  \"canonical_q16\": " << sample.q16 << ",\n"
              << "  \"route\": \"" << edge_ai::route_name(result.route) << "\",\n"
              << "  \"utility\": " << result.utility << ",\n"
              << "  \"model_loaded\": false,\n  \"network_executed\": false\n}\n";
  } catch (const std::exception& error) {
    std::cerr << error.what() << '\n';
    return 1;
  }
}
