cmake_minimum_required(VERSION 3.22)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  project(tnm_native_modules LANGUAGES C)
  enable_testing()
endif()
add_library(edge_native_modules STATIC
  tnm_native.c sha256.c generated/profiles.c
  generated/tomagi.c generated/pinion.c generated/maktubiii.c
  generated/twin.c generated/physics.c generated/machine.c
  runtime/wasm-rt-impl.c runtime/wasm-rt-mem-impl.c runtime/wasm-rt-exceptions-impl.c)
target_include_directories(edge_native_modules PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} generated runtime)
target_compile_features(edge_native_modules PUBLIC c_std_11)
target_compile_definitions(edge_native_modules PRIVATE
  WASM_RT_USE_MMAP=0 WASM_RT_MEMCHECK_BOUNDS_CHECK=1 WASM_RT_MEMCHECK_GUARD_PAGES=0
  WASM_RT_ALLOW_SEGUE=0 WASM_RT_INSTALL_SIGNAL_HANDLER=0)
if(NOT WIN32)
  target_compile_definitions(edge_native_modules PRIVATE _POSIX_C_SOURCE=200809L)
endif()
if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
  target_compile_options(edge_native_modules PRIVATE -fno-optimize-sibling-calls -frounding-math)
endif()
if(NOT WIN32)
  target_link_libraries(edge_native_modules PUBLIC m)
endif()
set_target_properties(edge_native_modules PROPERTIES POSITION_INDEPENDENT_CODE ON)
option(TNM_BUILD_TESTS "Build native profile differential and rejection tests" ON)
if(TNM_BUILD_TESTS AND NOT ANDROID AND EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/tests/native_tests.c")
  add_executable(tnm_native_tests tests/native_tests.c)
  target_link_libraries(tnm_native_tests PRIVATE edge_native_modules)
  add_test(NAME native_profiles COMMAND tnm_native_tests)
endif()
