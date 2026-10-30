cmake_minimum_required(VERSION 3.22.1)
project(tom_ecs_android LANGUAGES C CXX)

get_filename_component(EDGE_AI_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../.." ABSOLUTE)
set(EDGE_AI_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(EDGE_AI_BUILD_DEMO OFF CACHE BOOL "" FORCE)
add_subdirectory("${EDGE_AI_ROOT}" "${CMAKE_CURRENT_BINARY_DIR}/edge_ai")

add_library(lognetd_jni SHARED native_bridge.cpp)
target_compile_features(lognetd_jni PRIVATE cxx_std_20)
target_link_libraries(lognetd_jni PRIVATE edge_ai_core edge_ai_model edge_ai_ecs edge_ai_bundle edge_native_modules android log)

# NDK r27 requires explicit ELF/RELRO alignment for 16 KiB Android systems.
target_link_options(lognetd_jni PRIVATE
    "-Wl,-z,max-page-size=16384"
    "-Wl,-z,common-page-size=16384")

# Keep the Java debug build inspectable while avoiding unoptimized bit-LUT
# kernels. Preserve the source runtime's strict floating-point options.
foreach(native_target IN ITEMS edge_ai_core edge_ai_model edge_ai_ecs
        edge_ai_bundle edge_native_modules lognetd_jni)
    target_compile_options(${native_target} PRIVATE
        "$<$<CONFIG:Debug>:-O2>" -fno-fast-math -ffp-contract=off)
endforeach()
