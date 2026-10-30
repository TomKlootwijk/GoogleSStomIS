#ifndef TNM_INTERNAL_H
#define TNM_INTERNAL_H
#include "tnm_native.h"
#include "wasm-rt-impl.h"
#include "wasm-rt-exceptions.h"
#include "tomagi.h"
#include "pinion.h"
#include "maktubiii.h"
#include "twin.h"
#include "physics.h"
#include "machine.h"
typedef struct tnm_range { uint32_t offset, bytes; } tnm_range;
typedef struct tnm_definition {
  tnm_profile_info info;
  uint32_t input_offset, input_bits, output_offset, range_count;
  tnm_range ranges[2];
} tnm_definition;
struct tnm_instance {
  size_t index;
  uint64_t sequence;
  uint8_t *rollback;
  wasm_rt_memory_t *memory;
  const char *active_export;
  union {
    w2c_tomagi tomagi; w2c_pinion pinion; w2c_maktubiii maktubiii;
    w2c_twin twin; w2c_physics physics; w2c_machine machine;
  } module;
};
extern const tnm_definition tnm_definitions[8];
extern const char tnm_profile_json[];
void tnm_construct(tnm_instance *k);
void tnm_destruct(tnm_instance *k);
int tnm_initialize(tnm_instance *k, tnm_receipt *r);
int tnm_advance(tnm_instance *k, tnm_receipt *r);
void tnm_sha256_hex(const uint8_t *bytes, size_t n, char out[65]);
#endif
