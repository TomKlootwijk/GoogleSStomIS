#include "tnm_internal.h"
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void fail(char *out,size_t n,const char *message){if(out&&n)snprintf(out,n,"%s",message);}
size_t tnm_profile_count(void){return 8;}
const tnm_profile_info *tnm_profile(size_t i){return i<8?&tnm_definitions[i].info:NULL;}
const tnm_profile_info *tnm_find_profile(const char *id){if(!id)return NULL;for(size_t i=0;i<8;i++)if(!strcmp(id,tnm_definitions[i].info.id))return tnm_profile(i);return NULL;}
const char *tnm_profiles_json(void){return tnm_profile_json;}
const tnm_profile_info *tnm_info(const tnm_instance *k){return k?tnm_profile(k->index):NULL;}
uint64_t tnm_sequence(const tnm_instance *k){return k?k->sequence:0;}
void tnm_destroy(tnm_instance*k){if(k){if(k->memory)tnm_destruct(k);free(k->rollback);free(k);}}
tnm_instance *tnm_create(const char *id,char *error,size_t cap){
 size_t index=8;if(id)for(size_t i=0;i<8;i++)if(!strcmp(id,tnm_definitions[i].info.id)){index=i;break;}
 if(index==8){fail(error,cap,"Unknown pinned profile ID");return NULL;}
 tnm_instance*k=calloc(1,sizeof *k);if(!k){fail(error,cap,"Instance allocation failed");return NULL;}
 k->index=index;k->rollback=malloc(tnm_definitions[index].info.memory_bytes);
 if(!k->rollback){fail(error,cap,"Rollback allocation failed");tnm_destroy(k);return NULL;}
 wasm_rt_init();
 int trap=wasm_rt_impl_try();
 if(trap){fail(error,cap,"Wasm bootstrap trapped or memory allocation failed");tnm_destroy(k);return NULL;}
 tnm_construct(k);tnm_receipt receipt={0};
 if(k->memory->size!=tnm_definitions[index].info.memory_bytes||tnm_initialize(k,&receipt)!=TNM_OK){
  fail(error,cap,"Native bootstrap rejected");tnm_destroy(k);return NULL;
 }
 char hash[65];tnm_sha256_hex(k->memory->data,(size_t)k->memory->size,hash);
 if(strcmp(hash,tnm_definitions[index].info.bootstrap_sha256)){
  fail(error,cap,"Bootstrap bytes differ from pinned original WASM oracle");tnm_destroy(k);return NULL;
 }
 fail(error,cap,"");return k;
}
int tnm_memory_sha256(const tnm_instance*k,char out[65]){
 if(!k||!out)return TNM_ARGUMENT;
 tnm_sha256_hex(k->memory->data,(size_t)k->memory->size,out);return TNM_OK;
}
int tnm_read_memory(const tnm_instance*k,uint8_t*out,size_t n){
 if(!k||!out||n!=k->memory->size)return TNM_ARGUMENT;
 memcpy(out,k->memory->data,n);return TNM_OK;
}
int tnm_read_projection(const tnm_instance*k,uint8_t*out,size_t n){
 if(!k||!out||n!=tnm_info(k)->projection_bytes)return TNM_ARGUMENT;
 const tnm_definition*d=&tnm_definitions[k->index];size_t at=0;
 for(uint32_t i=0;i<d->range_count;i++){memcpy(out+at,k->memory->data+d->ranges[i].offset,d->ranges[i].bytes);at+=d->ranges[i].bytes;}
 return TNM_OK;
}
int tnm_read_output(const tnm_instance*k,uint8_t*out,size_t n){
 if(!k||!out||n!=tnm_info(k)->output_bytes)return TNM_ARGUMENT;
 uint8_t projection[4096];const tnm_definition*d=&tnm_definitions[k->index];
 tnm_read_projection(k,projection,d->info.projection_bytes);
 memcpy(out,projection+d->output_offset,n);return TNM_OK;
}
int tnm_restore_memory(tnm_instance*k,const uint8_t*b,size_t n,uint64_t sequence,char*error,size_t cap){
 if(!k||!b||n!=k->memory->size){fail(error,cap,"Snapshot size differs from selected profile");return TNM_ARGUMENT;}
 memmove(k->memory->data,b,n);k->sequence=sequence;fail(error,cap,"");return TNM_OK;
}
int tnm_step(tnm_instance*k,const uint8_t*input,size_t n,tnm_receipt*r,char*error,size_t cap){
 tnm_receipt local;if(!r)r=&local;memset(r,0,sizeof *r);
 if(!k){fail(error,cap,"Null native instance");return TNM_ARGUMENT;}
 r->sequence=k->sequence;const tnm_definition*d=&tnm_definitions[k->index];
 if((!input&&n)||(input&&(!d->info.input_bytes||n!=d->info.input_bytes))){fail(error,cap,"Input must match the exact source port byte length");tnm_memory_sha256(k,r->full_memory_sha256);return TNM_ARGUMENT;}
 if(input&&(d->input_bits%8)&&(input[n-1]>>(d->input_bits%8))){fail(error,cap,"Nonzero input padding");tnm_memory_sha256(k,r->full_memory_sha256);return TNM_ARGUMENT;}
 if(k->sequence==UINT64_MAX){fail(error,cap,"Native event sequence exhausted");tnm_memory_sha256(k,r->full_memory_sha256);return TNM_COUNTER_EXHAUSTED;}
 memcpy(k->rollback,k->memory->data,d->info.memory_bytes);
 if(input)memcpy(k->memory->data+d->input_offset,input,n);
 k->active_export="step";
 int trap=wasm_rt_impl_try();
 if(trap){
  memcpy(k->memory->data,k->rollback,d->info.memory_bytes);r->trap_code=(uint32_t)trap;
  if(error&&cap)snprintf(error,cap,"Native export %s trapped (%d); all memory restored",k->active_export,trap);
  tnm_memory_sha256(k,r->full_memory_sha256);return TNM_TRAP;
 }
 int status=tnm_advance(k,r);
 if(status==TNM_OK&&d->info.output_bits%8){uint8_t out[4096];tnm_read_output(k,out,d->info.output_bytes);if(out[d->info.output_bytes-1]>>(d->info.output_bits%8))status=TNM_SOURCE_STATUS;}
 if(status!=TNM_OK){
  memcpy(k->memory->data,k->rollback,d->info.memory_bytes);
  if(error&&cap)snprintf(error,cap,"Native export %s rejected; all memory restored",k->active_export);
  tnm_memory_sha256(k,r->full_memory_sha256);return status;
 }
 ++k->sequence;r->sequence=k->sequence;tnm_memory_sha256(k,r->full_memory_sha256);fail(error,cap,"");return TNM_OK;
}

/* Bounded JSON convenience; metadata contains only pinned source strings. */
typedef struct writer{char*p;size_t cap,n;int bad;}writer;
static void put(writer*w,const char*s){size_t n=strlen(s);if(n>=w->cap-w->n){w->bad=1;return;}memcpy(w->p+w->n,s,n);w->n+=n;w->p[w->n]=0;}
static void number(writer*w,uint64_t n){char b[32];snprintf(b,sizeof b,"%"PRIu64,n);put(w,b);}
static void quoted(writer*w,const char*s){put(w,"\"");for(;*s&&!w->bad;s++){unsigned char c=(unsigned char)*s;char b[7];if(c=='"'||c=='\\'){b[0]='\\';b[1]=(char)c;b[2]=0;put(w,b);}else if(c<32){snprintf(b,sizeof b,"\\u%04x",c);put(w,b);}else{b[0]=(char)c;b[1]=0;put(w,b);}}put(w,"\"");}
static void bytes_hex(writer*w,const uint8_t*p,size_t n){static const char h[]="0123456789abcdef";put(w,"\"");for(size_t i=0;i<n;i++){char b[3]={h[p[i]>>4],h[p[i]&15],0};put(w,b);}put(w,"\"");}
static int unhex(char c){if(c>='0'&&c<='9')return c-'0';if(c>='a'&&c<='f')return c-'a'+10;return -1;}
int tnm_run_json(const char*id,const char*input_hex,uint32_t steps,char*json,size_t cap){
 if(!json||cap<128)return TNM_CAPACITY;
 json[0]=0;writer w={json,cap,0,0};
 char error[256]="";tnm_instance*k=NULL;tnm_receipt r={0};int rc=TNM_OK;uint8_t input[4096];size_t n=0;
 if(!steps||steps>TNM_RUN_MAX_STEPS){rc=TNM_ARGUMENT;fail(error,sizeof error,"Steps must be between 1 and 64");}
 if(rc==TNM_OK){k=tnm_create(id,error,sizeof error);if(!k)rc=TNM_ARGUMENT;}
 if(rc==TNM_OK&&input_hex&&*input_hex){
  size_t len=0;while(input_hex[len]&&len<=8192)len++;
  if(len>8192||(len&1)||len/2!=tnm_info(k)->input_bytes){rc=TNM_ARGUMENT;fail(error,sizeof error,"Hex input length differs from pinned source port");}
  else{n=len/2;for(size_t i=0;i<n;i++){int hi=unhex(input_hex[2*i]),lo=unhex(input_hex[2*i+1]);if(hi<0||lo<0){rc=TNM_ARGUMENT;fail(error,sizeof error,"Input must be canonical lowercase hex");break;}input[i]=(uint8_t)((hi<<4)|lo);}}
 }
 for(uint32_t i=0;rc==TNM_OK&&i<steps;i++)rc=tnm_step(k,i==0&&n?input:NULL,i==0?n:0,&r,error,sizeof error);
 put(&w,"{\"schema\":\"TNM-NATIVE-RUN/1\",\"ok\":");put(&w,rc==TNM_OK?"true":"false");put(&w,",\"status\":");
 {char s[24];snprintf(s,sizeof s,"%d",rc);put(&w,s);}
 put(&w,",\"error\":");quoted(&w,error);
 if(k){
  const tnm_profile_info*p=tnm_info(k);char hash[65];uint8_t view[4096];tnm_memory_sha256(k,hash);
  put(&w,",\"id\":");quoted(&w,p->id);put(&w,",\"source_revision\":");quoted(&w,p->source_revision);
  put(&w,",\"wasm_sha256\":");quoted(&w,p->wasm_sha256);put(&w,",\"recipe_sha256\":");quoted(&w,p->recipe_sha256);
  put(&w,",\"bootstrap_sha256\":");quoted(&w,p->bootstrap_sha256);put(&w,",\"steps_committed\":");number(&w,k->sequence);
  put(&w,",\"memory_bytes\":");number(&w,p->memory_bytes);put(&w,",\"full_memory_sha256\":");quoted(&w,hash);
  put(&w,",\"input_application\":\"first event only\",\"output_type\":");quoted(&w,p->output_type);
  put(&w,",\"output_unit\":");quoted(&w,p->output_unit);put(&w,",\"clock\":");quoted(&w,p->clock);
  put(&w,",\"output_hex\":");tnm_read_output(k,view,p->output_bytes);bytes_hex(&w,view,p->output_bytes);
  put(&w,",\"projection_hex\":");tnm_read_projection(k,view,p->projection_bytes);bytes_hex(&w,view,p->projection_bytes);
  put(&w,",\"last_call_statuses\":[");for(uint32_t i=0;i<r.call_count;i++){char s[32];if(i)put(&w,",");snprintf(s,sizeof s,"%"PRId64,r.call_status[i]);put(&w,s);}put(&w,"]");
  put(&w,",\"trap_code\":");number(&w,r.trap_code);put(&w,",\"scope\":");quoted(&w,p->scope);
 }
 put(&w,"}");tnm_destroy(k);
 if(w.bad){snprintf(json,cap,"{\"ok\":false,\"status\":-5,\"error\":\"JSON output capacity too small\"}");return TNM_CAPACITY;}
 return rc;
}
