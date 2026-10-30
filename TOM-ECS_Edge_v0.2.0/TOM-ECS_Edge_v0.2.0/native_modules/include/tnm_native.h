#ifndef TNM_NATIVE_H
#define TNM_NATIVE_H
#include <stddef.h>
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif

/* Fixed, pinned XD-KERNEL-RECIPE/1 profiles. Byte ports retain source types.
 * All operations on an instance require external serialization. Each step is
 * allocation-free and transactional: rejected/trapped steps restore every
 * linear-memory byte and leave sequence unchanged. No arbitrary Wasm loading.
 */
#define TNM_ABI_VERSION 1u
#define TNM_MAX_CALLS 16u
#define TNM_RUN_MAX_STEPS 64u
typedef struct tnm_instance tnm_instance;
typedef struct tnm_profile_info {
  const char *id;
  const char *model;
  const char *source_revision;
  const char *wasm_sha256;
  const char *recipe_sha256;
  const char *bootstrap_sha256;
  const char *input_type;
  const char *input_unit;
  const char *output_type;
  const char *output_unit;
  const char *clock;
  const char *scope;
  uint32_t memory_bytes;
  uint32_t input_bytes;
  uint32_t projection_bytes;
  uint32_t output_bytes;
  uint32_t output_bits;
} tnm_profile_info;
typedef struct tnm_receipt {
  uint64_t sequence;
  uint32_t call_count;
  int64_t call_status[TNM_MAX_CALLS];
  uint32_t trap_code;
  char full_memory_sha256[65];
} tnm_receipt;
enum {
  TNM_OK=0, TNM_ARGUMENT=-1, TNM_ALLOCATION=-2, TNM_SOURCE_STATUS=-3,
  TNM_TRAP=-4, TNM_CAPACITY=-5, TNM_COUNTER_EXHAUSTED=-6
};

size_t tnm_profile_count(void);
const tnm_profile_info *tnm_profile(size_t index);
const tnm_profile_info *tnm_find_profile(const char *id);
const char *tnm_profiles_json(void); /* Static immutable UTF-8 JSON array. */
tnm_instance *tnm_create(const char *id, char *error, size_t error_capacity);
void tnm_destroy(tnm_instance *instance);
const tnm_profile_info *tnm_info(const tnm_instance *instance);
uint64_t tnm_sequence(const tnm_instance *instance);

/* NULL,0 means no new input. Otherwise require exactly input_bytes. Native
 * kernel validation determines the admissible numeric domain. Never substitute
 * a device measurement for a source quantity without an explicit conversion.
 */
int tnm_step(tnm_instance *instance, const uint8_t *input, size_t input_bytes,
             tnm_receipt *receipt, char *error, size_t error_capacity);
int tnm_read_memory(const tnm_instance *instance, uint8_t *out, size_t bytes);
int tnm_read_projection(const tnm_instance *instance, uint8_t *out, size_t bytes);
int tnm_read_output(const tnm_instance *instance, uint8_t *out, size_t bytes);
int tnm_memory_sha256(const tnm_instance *instance, char out_hex[65]);

/* Trusted byte snapshot import for an already-selected pinned profile. This
 * restores bytes and a sequence; it does not prove reachable history. Caller
 * must bind profile/recipe/source hashes and authenticate or replay snapshots.
 * On malformed size or NULL argument no state changes. */
int tnm_restore_memory(tnm_instance *instance, const uint8_t *bytes, size_t size,
                       uint64_t sequence, char *error, size_t error_capacity);

/* Convenience for JNI: new default instance, 1..64 events; optional canonical
 * hex input is applied to the FIRST event only. JSON reports exact typed output,
 * full-memory digest, hashes, source statuses, and rejection. Provide >=16384
 * bytes for all current profiles. It never reads the network or filesystem. */
int tnm_run_json(const char *id, const char *input_hex, uint32_t steps,
                 char *json, size_t capacity);
#ifdef __cplusplus
}
#endif
#endif
