#include "tnm_native.h"
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "golden.inc"
extern void tnm_sha256_hex(const uint8_t*,size_t,char[65]);
static unsigned checks;
#define CHECK(c) do{checks++;if(!(c)){fprintf(stderr,"Native check %u failed at line %d: %s\n",checks,__LINE__,#c);exit(1);}}while(0)
static void hex(const uint8_t*b,size_t n,char*out){const char*h="0123456789abcdef";for(size_t i=0;i<n;i++){out[2*i]=h[b[i]>>4];out[2*i+1]=h[b[i]&15];}out[2*n]=0;}
static void same(const tnm_instance*k,const char*hash,uint64_t seq){char actual[65];CHECK(tnm_memory_sha256(k,actual)==0);CHECK(!strcmp(actual,hash));CHECK(tnm_sequence(k)==seq);}
int main(void){
 char hash[65],error[256],viewhex[8193];uint8_t view[4096];tnm_receipt receipt;
 tnm_sha256_hex((const uint8_t*)"",0,hash);CHECK(!strcmp(hash,"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"));
 tnm_sha256_hex((const uint8_t*)"abc",3,hash);CHECK(!strcmp(hash,"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"));
 const char *longvector="abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";
 tnm_sha256_hex((const uint8_t*)longvector,strlen(longvector),hash);CHECK(!strcmp(hash,"248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"));
 CHECK(tnm_profile_count()==8);CHECK(!tnm_profile(8));CHECK(!tnm_find_profile("unknown"));CHECK(!tnm_create("unknown",error,sizeof error));
 for(size_t i=0;i<8;i++){
  const golden_profile*g=&goldens[i];const tnm_profile_info*p=tnm_profile(i);
  CHECK(!strcmp(g->id,p->id));CHECK(tnm_find_profile(p->id)==p);
  tnm_instance*k=tnm_create(g->id,error,sizeof error);CHECK(k!=NULL);same(k,g->bootstrap,0);
  uint8_t *initial=malloc(p->memory_bytes),*saved=malloc(p->memory_bytes);CHECK(initial&&saved);
  CHECK(tnm_read_memory(k,initial,p->memory_bytes)==0);
  CHECK(tnm_read_memory(k,saved,p->memory_bytes-1)==TNM_ARGUMENT);
  for(unsigned event=0;event<4;event++){
   const golden_event*e=&g->events[event];CHECK(tnm_step(k,NULL,0,&receipt,error,sizeof error)==TNM_OK);
   CHECK(receipt.sequence==event+1);CHECK(!strcmp(receipt.full_memory_sha256,e->memory));same(k,e->memory,event+1);
   CHECK(receipt.call_count==e->count);for(unsigned c=0;c<e->count;c++)CHECK(receipt.call_status[c]==e->statuses[c]);
   CHECK(tnm_read_projection(k,view,p->projection_bytes)==0);hex(view,p->projection_bytes,viewhex);CHECK(!strcmp(viewhex,e->projection));
   CHECK(tnm_read_output(k,view,p->output_bytes)==0);hex(view,p->output_bytes,viewhex);CHECK(!strcmp(viewhex,e->output));
  }
  const char *after=g->events[3].memory;
  CHECK(tnm_read_memory(k,saved,p->memory_bytes)==0);
  CHECK(tnm_step(k,(const uint8_t*)"x",1,&receipt,error,sizeof error)==TNM_ARGUMENT);same(k,after,4);
  CHECK(tnm_step(k,NULL,1,&receipt,error,sizeof error)==TNM_ARGUMENT);same(k,after,4);
  CHECK(tnm_restore_memory(k,initial,p->memory_bytes-1,0,error,sizeof error)==TNM_ARGUMENT);same(k,after,4);
  CHECK(tnm_restore_memory(k,initial,p->memory_bytes,0,error,sizeof error)==0);same(k,g->bootstrap,0);
  for(unsigned event=0;event<4;event++){CHECK(tnm_step(k,NULL,0,&receipt,error,sizeof error)==0);same(k,g->events[event].memory,event+1);}
  CHECK(tnm_restore_memory(k,saved,p->memory_bytes,UINT64_MAX,error,sizeof error)==0);
  CHECK(tnm_step(k,NULL,0,&receipt,error,sizeof error)==TNM_COUNTER_EXHAUSTED);same(k,after,UINT64_MAX);
  CHECK(tnm_restore_memory(k,saved,p->memory_bytes,4,error,sizeof error)==0);
  if(p->input_bytes){
   memset(view,0,sizeof view);if(i==2)view[0]=2; /* mirror binary value invalid; rational zero denominators invalid. */
   CHECK(tnm_step(k,view,p->input_bytes,&receipt,error,sizeof error)==TNM_SOURCE_STATUS);same(k,after,4);
  }
  char json[16384];CHECK(tnm_run_json(p->id,"",4,json,sizeof json)==0);CHECK(strstr(json,after)!=NULL);
  CHECK(tnm_run_json(p->id,"ff",1,json,sizeof json)==TNM_ARGUMENT);
  CHECK(tnm_run_json(p->id,"",0,json,sizeof json)==TNM_ARGUMENT);
  CHECK(tnm_run_json(p->id,"",65,json,sizeof json)==TNM_ARGUMENT);
  CHECK(tnm_run_json(p->id,"",1,json,128)==TNM_CAPACITY);
  printf("{\"id\":\"%s\",\"whole_memory_golden_events\":4,\"restore_replay\":true,\"last_sha256\":\"%s\"}\n",p->id,after);
  free(initial);free(saved);tnm_destroy(k);
 }
 /* Source TK profile has an explicit tick limit: verify all-byte rollback at it. */
 tnm_instance*tk=tnm_create(goldens[5].id,error,sizeof error);CHECK(tk!=NULL);
 for(unsigned i=0;i<256;i++)CHECK(tnm_step(tk,NULL,0,&receipt,error,sizeof error)==0);
 tnm_memory_sha256(tk,hash);CHECK(tnm_step(tk,NULL,0,&receipt,error,sizeof error)==TNM_SOURCE_STATUS);same(tk,hash,256);CHECK(receipt.call_status[0]==3);tnm_destroy(tk);
 printf("{\"result\":\"PASS\",\"checks\":%u,\"profiles\":8,\"kernels\":6,\"source_golden_events\":32}\n",checks);
 return 0;
}
