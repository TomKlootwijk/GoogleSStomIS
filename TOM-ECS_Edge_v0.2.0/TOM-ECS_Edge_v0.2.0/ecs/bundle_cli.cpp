#include "edge_ai/bundle.hpp"
#include <fstream>
#include <iostream>
#include <vector>

int main(int argc,char** argv) {
  if(argc!=2) { std::cerr << "usage: tom_ecs_replay FILE.tecs\n"; return 2; }
  std::ifstream stream(argv[1],std::ios::binary|std::ios::ate);
  if(!stream) { std::cerr << "cannot open package\n"; return 2; }
  const auto length=stream.tellg();
  if(length<0 || static_cast<std::uint64_t>(length)>edge_ai::bundle::kMaximumBytes) {
    std::cerr << "package exceeds byte limit\n"; return 2;
  }
  stream.seekg(0);
  std::vector<std::uint8_t> bytes(static_cast<std::size_t>(length));
  if(!stream.read(reinterpret_cast<char*>(bytes.data()),length)) {
    std::cerr << "cannot read complete package\n"; return 2;
  }
  const auto result=edge_ai::bundle::inspect_and_replay_json(bytes);
  std::cout << result << '\n';
  return result.find("\"ok\":true")!=std::string::npos?0:1;
}
