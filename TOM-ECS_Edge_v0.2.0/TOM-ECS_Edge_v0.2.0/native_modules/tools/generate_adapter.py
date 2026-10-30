#!/usr/bin/env python3
"""Compile the eight admitted finite recipes to C glue; no model reimplementation."""
import hashlib,json,pathlib
base=pathlib.Path(__file__).resolve().parents[1]
manifest=json.loads((base/'source_manifest.json').read_text())
golden={p['id']:p for p in json.loads((base/'tests/golden.json').read_text())['profiles']}
q=lambda s:json.dumps(s,ensure_ascii=True)
lines=['/* Generated from pinned XD-KERNEL-RECIPE/1; see source_manifest.json. */','#include "tnm_internal.h"','#include <string.h>']
resources={}
for p in manifest['profiles']:
 for b in p['recipe']['bindings']:
  if not b['path'].endswith('.wasm'):resources[b['path']]=b
for i,(path,b) in enumerate(sorted(resources.items())):
 b['symbol']='boot_'+str(i);data=(base/'upstream'/path).read_bytes()
 assert hashlib.sha256(data).hexdigest()==b['sha256']
 lines.append('static const uint8_t '+b['symbol']+'['+str(len(data))+']={')
 entries=['['+str(i)+']='+str(x) for i,x in enumerate(data) if x]
 lines += [','.join(entries[i:i+12])+',' for i in range(0,len(entries),12)]
 lines.append('};')
infos=[]
for p in manifest['profiles']:
 r=p['recipe']; inp=r.get('input',{});out=r['output'];m=r['metadata']
 modulebind=next(b for b in r['bindings'] if b['path']==r['module'])
 info={
  'id':p['id'],'model':m['model'],'source_revision':manifest['revision'],
  'wasm_sha256':modulebind['sha256'],'recipe_sha256':p['recipe_sha256'],
  'bootstrap_sha256':golden[p['id']]['bootstrap_sha256'],
  'input_type':inp.get('type','none'),'input_unit':inp.get('unit','none'),
  'output_type':out['type'],'output_unit':out['unit'],'clock':out['clock'],
  'scope':m['native_source_profile_scope'],'memory_bytes':int(r['memory_bytes']),
  'input_bytes':int(inp.get('bytes',0)),
  'projection_bytes':sum(int(x['bytes']) for x in r['projection']),
  'output_bytes':(int(out['bits'])+7)//8,'output_bits':int(out['bits'])}
 infos.append(info)
 p['published_info']=info
lines.append('const tnm_definition tnm_definitions[8]={')
for p,info in zip(manifest['profiles'],infos):
 r=p['recipe']; inp=r.get('input',{});out=r['output']
 vals=[q(x) if isinstance(x,str) else str(x) for x in info.values()]
 ranges=','.join('{'+v['offset']+','+v['bytes']+'}' for v in r['projection'])
 lines.append('{{'+','.join(vals)+'},'+str(inp.get('offset',0))+','+str(inp.get('bits',0))+','+out['offset']+','+str(len(r['projection']))+',{'+ranges+'}},')
lines.append('};')
lines.append('const char tnm_profile_json[]='+q(json.dumps(infos,separators=(',',':'),ensure_ascii=True))+';')
lines += ['static uint32_t rd32(const uint8_t*p){return (uint32_t)p[0]|((uint32_t)p[1]<<8)|((uint32_t)p[2]<<16)|((uint32_t)p[3]<<24);}',
'static uint64_t rd64(const uint8_t*p){return (uint64_t)rd32(p)|((uint64_t)rd32(p+4)<<32);}']
for phase in ['construct','destruct']:
 lines.append('void tnm_'+phase+'(tnm_instance*k){switch(k->index){')
 for i,p in enumerate(manifest['profiles']):
  n=p['module_name']; lines.append('case '+str(i)+':')
  if phase=='construct':lines.append('k->memory=&k->module.'+n+'.w2c_memory;wasm2c_'+n+'_instantiate(&k->module.'+n+');break;')
  else:lines.append('wasm2c_'+n+'_free(&k->module.'+n+');break;')
 lines.append('default:break;}}')
for phase in ['initialize','step']:
 for i,p in enumerate(manifest['profiles']):
  r=p['recipe']; n=p['module_name']
  lines.append('static int '+phase+'_'+str(i)+'(tnm_instance*k,tnm_receipt*r){')
  lines.append('(void)r;')
  for a in r.get(phase,[]):
   if a['op']=='resource_write':
    b=resources[a['resource']]; assert int(b['bytes'])==int(a['bytes'])
    lines.append('memcpy(k->memory->data+'+a['offset']+','+b['symbol']+','+a['bytes']+');')
   elif a['op']=='write':
    data=bytes.fromhex(a['hex']);lines.append('{static const uint8_t b[]={'+','.join(str(x) for x in data)+'};memcpy(k->memory->data+'+a['offset']+',b,sizeof b);}')
   elif a['op']=='copy':lines.append('memmove(k->memory->data+'+a['to']+',k->memory->data+'+a['from']+','+a['bytes']+');')
   else:
    assert a['op']=='call'
    args=['&k->module.'+n]
    for v in a['args']:
     if 'literal' in v:arg='UINT'+v['type'][1:]+'_C('+v['literal']+')'
     elif 'memory' in v:arg='rd'+v['type'][1:]+'(k->memory->data+'+v['memory']+')'
     else:raise ValueError('Unbound context field not admitted')
     args.append(arg)
    call='w2c_'+n+'_'+a['export']+'('+','.join(args)+')'
    lines.append('k->active_export='+q(a['export'])+';')
    if a['accept']==['void']:lines.append(call+';')
    else:
     lines.append('{uint32_t status='+call+';r->call_status[r->call_count++]=(int64_t)(int32_t)status;')
     lines.append('if('+ '&&'.join('status!='+v+'u' for v in a['accept'])+')return TNM_SOURCE_STATUS;}')
  lines.append('return TNM_OK;}')
 name='advance' if phase=='step' else phase
 lines.append('int tnm_'+name+'(tnm_instance*k,tnm_receipt*r){switch(k->index){')
 for i in range(len(infos)):lines.append('case '+str(i)+':return '+phase+'_'+str(i)+'(k,r);')
 lines.append('default:return TNM_ARGUMENT;}}')
(base/'generated/profiles.c').write_text('\n'.join(lines)+'\n')
(base/'profiles.json').write_text(json.dumps(infos,indent=2)+'\n')
manifest['generated_adapter']={'path':'generated/profiles.c','sha256':hashlib.sha256((base/'generated/profiles.c').read_bytes()).hexdigest()}
(base/'source_manifest.json').write_text(json.dumps(manifest,indent=2,ensure_ascii=False)+'\n')
print(json.dumps({'profiles':len(infos),'bootdata_bytes':sum(int(v['bytes']) for v in resources.values()),'generated_C_bytes':(base/'generated/profiles.c').stat().st_size}))
