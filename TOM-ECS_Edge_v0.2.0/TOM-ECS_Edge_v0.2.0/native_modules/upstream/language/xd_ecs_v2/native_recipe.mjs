// Generic, retained-byte ABI mechanics. Equations execute only in admitted WASM.
// The outer XD boot/registry admits a recipe. This adapter does not authorize it.
import crypto from 'node:crypto';
export const canonical=x=>Array.isArray(x)?'['+x.map(canonical).join(',')+']':x&&typeof x==='object'?'{'+Object.keys(x).sort().map(k=>JSON.stringify(k)+':'+canonical(x[k])).join(',')+'}':JSON.stringify(x);
export const sha=x=>crypto.createHash('sha256').update(x).digest('hex');
const clone=x=>JSON.parse(canonical(x));
export class RecipeError extends Error{constructor(code,message){super(code+': '+message);this.code=code;}}
export function need(value,code,message){if(!value)throw new RecipeError(code,message);}
export function integer(x,min=0n,max=(1n<<64n)-1n){
 need(typeof x==='string'&&/^(0|-[1-9][0-9]*|[1-9][0-9]*)$/.test(x),'INTEGER','Canonical decimal string required');
 const n=BigInt(x);need(n>=min&&n<=max,'RANGE','Integer outside admitted domain');return n;
}
const small=(x,max)=>Number(integer(x,0n,BigInt(max)));
const hex=x=>{need(typeof x==='string'&&/^(?:[0-9a-f]{2})*$/.test(x),'HEX','Canonical lowercase byte hex required');return Buffer.from(x,'hex');};
const own=(o,k)=>o&&Object.hasOwn(o,k)?o[k]:undefined;
const moduleCache=new Map();

// State outside the retained linear memory would invalidate byte-only restore.
// This profile therefore admits one fixed, unshared 32-bit memory and no
// globals, tables or segment state. It is deliberately an explicit ABI limit.
export function auditRetainedStateBinary(binary,expectedMemory){
 const b=Buffer.from(binary);need(b.length>=8&&b.subarray(0,8).equals(Buffer.from('0061736d01000000','hex')),'WASM_HEADER','Core WASM version1 required');
 let p=8,memories=0;const sections=[];
 function uleb(end=b.length){let x=0n,s=0n;for(let i=0;i<5;i++){need(p<end,'WASM_SECTION','Truncated integer');const v=b[p++];x|=BigInt(v&127)<<s;if(!(v&128)){need(x<=0xffffffffn,'WASM_SECTION','Integer exceeds u32');return Number(x);}s+=7n;}throw new RecipeError('WASM_SECTION','Overlong u32 integer');}
 while(p<b.length){const id=b[p++],n=uleb(),end=p+n;need(end<=b.length,'WASM_SECTION','Truncated section');sections.push(id);
  if([4,6,9,11,12].includes(id)){const count=uleb(end);need(count===0,'UNRETAINED_STATE','Tables/globals/element/data segment state is outside this profile');}
  if(id===5){const count=uleb(end);need(count===1,'MEMORY','Exactly one defined memory required');const flags=uleb(end),min=uleb(end);need(flags===1,'MEMORY','Fixed unshared 32-bit memory required');const max=uleb(end);need(min===max&&min*65536===expectedMemory,'MEMORY','Memory bounds differ from recipe');memories=count;need(p===end,'MEMORY','Unexpected memory metadata');}
  p=end;
 }
 need(memories===1,'MEMORY','No declared retained memory');return{memory_bytes:expectedMemory,globals:0,tables:0,segments:0,sections};
}

export function validateRecipe(recipe){
 need(recipe?.schema==='XD-KERNEL-RECIPE/1','RECIPE_SCHEMA','Unknown recipe');
 need(typeof recipe.id==='string'&&recipe.id.length>0&&recipe.id.length<=128,'IDENTITY','Recipe ID required');
 const memory=small(recipe.memory_bytes,64*1024*1024);
 need(memory>=65536&&memory%65536===0,'MEMORY','Whole fixed WASM pages required');
 need(Array.isArray(recipe.bindings)&&recipe.bindings.length>0,'BINDINGS','Retained resource bindings required');
 const paths=new Set();for(const b of recipe.bindings){
  need(typeof b.path==='string'&&!paths.has(b.path)&&/^[0-9a-f]{64}$/.test(b.sha256),'BINDINGS','Unique resource identities required');paths.add(b.path);
 }
 need(paths.has(recipe.module),'MODULE','Module bytes must be bound');
 const range=(o,n)=>{o=small(o,memory);n=small(n,memory);need(o+n<=memory,'MEMORY_RANGE','Recipe memory range exceeds capacity');};
 for(const a of recipe.initialize??[]) {
  need(a.op==='resource_write'||a.op==='call'||a.op==='copy'||a.op==='write','OPCODE','Unknown initialization operation');
  if(a.op==='resource_write'){need(paths.has(a.resource),'RESOURCE','Unbound initialization bytes');range(a.offset,a.bytes);}
 }
 for(const a of [...(recipe.initialize??[]),...(recipe.step??[])]) {
  need(['resource_write','call','copy','write'].includes(a.op),'OPCODE','Unknown finite recipe operation');
  if(a.op==='copy'){range(a.from,a.bytes);range(a.to,a.bytes);}
  if(a.op==='write'){const b=hex(a.hex);range(a.offset,String(b.length));}
  if(a.op==='resource_write'){need(paths.has(a.resource),'RESOURCE','Unbound resource');range(a.offset,a.bytes);}
  if(a.op==='call'){
   need(typeof a.export==='string'&&Array.isArray(a.args)&&Array.isArray(a.accept)&&a.accept.length>0,'CALL','Explicit export, typed arguments and admitted statuses required');
   for(const x of a.accept)if(x!=='void')integer(x,-(1n<<63n),(1n<<64n)-1n);
   for(const v of a.args){need(v.type==='i32'||v.type==='i64','ARG_TYPE','Only exact integer call arguments are admitted');
    need([v.literal!==undefined,v.field!==undefined,v.memory!==undefined].filter(Boolean).length===1,'ARGUMENT','Exactly one literal, explicit event field or retained word required');
    if(v.literal!==undefined)integer(v.literal,v.type==='i32'?-(1n<<31n):-(1n<<63n),v.type==='i32'?(1n<<32n)-1n:(1n<<64n)-1n);
    else if(v.memory!==undefined)range(v.memory,v.type==='i64'?'8':'4');
    else need(typeof v.field==='string'&&v.field.length>0,'ARGUMENT','Explicit event field name required');
   }
  }
 }
 need(Array.isArray(recipe.projection)&&recipe.projection.length>0,'PROJECTION','Retained projection ranges required');
 let frame=0;for(const p of recipe.projection){range(p.offset,p.bytes);frame+=small(p.bytes,memory);}
 need(frame<=4096,'FRAME_CAPACITY','Current XD F frame capacity is4096bytes');
 const bits=small(recipe.output.bits,frame*8),offset=small(recipe.output.offset,frame);
 need(bits>0&&offset+Math.ceil(bits/8)<=frame,'PORT','Output view exceeds exact projected frame');
 need(typeof recipe.output.type==='string'&&typeof recipe.output.unit==='string'&&typeof recipe.output.clock==='string','PORT','Nominal output type/unit/clock required');
 if(recipe.input){range(recipe.input.offset,recipe.input.bytes);need(small(recipe.input.bytes,memory)<=4096,'FRAME_CAPACITY','Current input frame capacity is4096bytes');need(small(recipe.input.bits,memory*8)<=small(recipe.input.bytes,memory)*8,'PORT','Input bit count exceeds bytes');
  need(typeof recipe.input.type==='string'&&typeof recipe.input.unit==='string'&&typeof recipe.input.clock==='string','PORT','Nominal input type/unit/clock required');}
 return {memory,frame};
}

export class NativeRecipeKernel{
 constructor(recipe,resources){
  this.recipe=clone(recipe);const shape=validateRecipe(this.recipe);this.profile_sha256=sha(canonical(this.recipe));
  this.resources=clone(resources);const expected=this.recipe.bindings.map(x=>x.path).sort();
  need(canonical(Object.keys(this.resources).sort())===canonical(expected),'RESOURCE_SET','Missing/extra retained recipe resource');
  for(const b of this.recipe.bindings)need(sha(hex(own(this.resources,b.path)))===b.sha256,'SOURCE_IDENTITY','Changed retained resource '+b.path);
  const binary=hex(this.resources[this.recipe.module]),key=sha(binary);this.binary_state_audit=auditRetainedStateBinary(binary,shape.memory);let module=moduleCache.get(key);
  if(!module){module=new WebAssembly.Module(binary);need(WebAssembly.Module.imports(module).length===0,'IMPORT','Host imports are not admitted');moduleCache.set(key,module);}
  this.instance=new WebAssembly.Instance(module,{});this.e=this.instance.exports;
  need(this.e.memory instanceof WebAssembly.Memory&&this.e.memory.buffer.byteLength===shape.memory,'MEMORY','Wrong finite memory profile');
  // A rejected bootstrap is private: this also checks a declared fixed maximum.
  try{this.e.memory.grow(1);throw new RecipeError('MEMORY_GROWTH','Memory maximum is not fixed');}catch(e){if(!(e instanceof RangeError))throw e;}
  this.frame_bytes=shape.frame;this.sequence=0n;this.last_receipt=null;
  this._actions(this.recipe.initialize??[],{},[]);
 }
 read(offset=0,n=this.e.memory.buffer.byteLength){need(Number.isSafeInteger(offset)&&Number.isSafeInteger(n)&&offset>=0&&n>=0&&offset+n<=this.e.memory.buffer.byteLength,'MEMORY_RANGE','Read outside profile');return Buffer.from(new Uint8Array(this.e.memory.buffer,offset,n));}
 _write(offset,b){need(offset>=0&&offset+b.length<=this.e.memory.buffer.byteLength,'MEMORY_RANGE','Write outside profile');new Uint8Array(this.e.memory.buffer,offset,b.length).set(b);}
 copy(){const n=new NativeRecipeKernel(this.recipe,this.resources);n._write(0,this.read());n.sequence=this.sequence;n.last_receipt=clone(this.last_receipt);return n;}
 _argument(v,context){let raw=v.literal!==undefined?v.literal:own(context,v.field);
  if(v.memory!==undefined){const d=new DataView(this.e.memory.buffer),o=small(v.memory,this.e.memory.buffer.byteLength);raw=String(v.type==='i64'?d.getBigUint64(o,true):d.getUint32(o,true));}
  const value=integer(raw,v.type==='i32'?-(1n<<31n):-(1n<<63n),v.type==='i32'?(1n<<32n)-1n:(1n<<64n)-1n);
  if(v.min!==undefined)need(value>=integer(v.min,-(1n<<63n),(1n<<64n)-1n),'ARG_RANGE','Event argument below declared range');
  if(v.max!==undefined)need(value<=integer(v.max,-(1n<<63n),(1n<<64n)-1n),'ARG_RANGE','Event argument above declared range');
  return v.type==='i64'?BigInt.asIntN(64,value):Number(BigInt.asIntN(32,value));
 }
 _actions(actions,context,receipts){
  for(const a of actions){
   if(a.op==='copy'){const n=small(a.bytes,this.e.memory.buffer.byteLength),from=small(a.from,this.e.memory.buffer.byteLength),to=small(a.to,this.e.memory.buffer.byteLength);this._write(to,this.read(from,n));receipts.push({op:'copy',from:a.from,to:a.to,bytes:a.bytes});}
   else if(a.op==='write'){const b=hex(a.hex);this._write(small(a.offset,this.e.memory.buffer.byteLength),b);receipts.push({op:'write',offset:a.offset,hex:a.hex});}
   else if(a.op==='resource_write'){const b=hex(this.resources[a.resource]);need(b.length===small(a.bytes,this.e.memory.buffer.byteLength),'RESOURCE_SIZE','Wrong retained resource size');this._write(small(a.offset,this.e.memory.buffer.byteLength),b);receipts.push({op:'resource_write',resource:a.resource,sha256:sha(b),offset:a.offset});}
   else{
    const f=own(this.e,a.export);need(typeof f==='function','EXPORT','Unknown admitted export '+a.export);
    const args=a.args.map(v=>this._argument(v,context));let result;
    try{result=f(...args);}catch(e){throw new RecipeError('NATIVE_TRAP',a.export+': '+e.message);}
    const status=result===undefined?'void':String(result);need(a.accept.includes(status),'NATIVE_STATUS',a.export+' returned '+status);
    receipts.push({op:'call',export:a.export,args:args.map(String),status});
   }
  }
 }
 projection(){return Buffer.concat(this.recipe.projection.map(p=>this.read(small(p.offset,this.e.memory.buffer.byteLength),small(p.bytes,this.e.memory.buffer.byteLength))));}
 output(){const f=this.projection(),n=small(this.recipe.output.bits,f.length*8),o=small(this.recipe.output.offset,f.length),b=f.subarray(o,o+Math.ceil(n/8));if(n%8)need((b.at(-1)>>(n%8))===0,'PADDING','Nonzero output padding');return Buffer.from(b);}
 advance(context={},input=null){
  need(this.sequence<((1n<<64n)-1n),'COUNTER_EXHAUSTED','Recipe event sequence cannot wrap');
  const next=this.copy(),calls=[];
  if(input!==null){need(next.recipe.input,'INPUT_PORT','No admitted input port');const b=Buffer.isBuffer(input)?input:hex(input);
   need(b.length===small(next.recipe.input.bytes,next.e.memory.buffer.byteLength),'PORT_WIDTH','Wrong input bytes');
   const n=small(next.recipe.input.bits,b.length*8);if(n%8)need((b.at(-1)>>(n%8))===0,'PADDING','Nonzero input padding');
   next._write(small(next.recipe.input.offset,next.e.memory.buffer.byteLength),b);calls.push({op:'input',hex:b.toString('hex'),offset:next.recipe.input.offset});}
  next._actions(next.recipe.step??[],context,calls);const output=next.output();
  const receipt={sequence:String(this.sequence+1n),profile_sha256:this.profile_sha256,calls,output_hex:output.toString('hex'),full_memory_sha256:sha(next.read())};
  this.instance=next.instance;this.e=next.e;this.sequence++;this.last_receipt=clone(receipt);return receipt;
 }
 snapshot(){return {schema:'XD-NATIVE-RECIPE-SNAPSHOT/1',recipe:clone(this.recipe),profile_sha256:this.profile_sha256,resources:clone(this.resources),sequence:String(this.sequence),memory_hex:this.read().toString('hex'),last_receipt:clone(this.last_receipt)};}
 static restore(s,admittedRecipe){
  need(s?.schema==='XD-NATIVE-RECIPE-SNAPSHOT/1','SNAPSHOT','Wrong snapshot schema');
  need(canonical(s.recipe)===canonical(admittedRecipe)&&sha(canonical(admittedRecipe))===s.profile_sha256,'PROFILE','Snapshot cannot authorize its own recipe');
  const n=new NativeRecipeKernel(admittedRecipe,s.resources),b=hex(s.memory_hex);need(b.length===n.e.memory.buffer.byteLength,'SNAPSHOT_SIZE','Wrong full native memory size');n._write(0,b);n.sequence=integer(s.sequence);n.last_receipt=clone(s.last_receipt);
  // This is byte-state restoration, not a proof of trajectory. The enclosing
  // XD language validates event-boundary snapshots by complete prefix replay.
  if(n.last_receipt){need(n.last_receipt.sequence===s.sequence&&n.last_receipt.profile_sha256===n.profile_sha256&&n.last_receipt.full_memory_sha256===sha(b),'RECEIPT','Snapshot receipt/state mismatch');need(n.last_receipt.output_hex===n.output().toString('hex'),'VIEW','Snapshot projection differs from receipt');}
  return n;
 }
}
