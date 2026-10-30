// Executes the inspected pinned original recipe adapter in Node's WebAssembly
// runtime. No downloaded source receives filesystem or network bindings.
// This local harness reads only retained, hash-bound artifacts and writes tests.
import fs from 'node:fs';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {NativeRecipeKernel,sha} from '../upstream/language/xd_ecs_v2/native_recipe.mjs';
const base=path.resolve(path.dirname(fileURLToPath(import.meta.url)),'..');
const manifest=JSON.parse(fs.readFileSync(path.join(base,'source_manifest.json'),'utf8'));
const report={schema:'TNM-WASM-GOLDEN/1',source_revision:manifest.revision,
  oracle:'Pinned original NativeRecipeKernel with Node WebAssembly; whole linear memory SHA-256',
  node:process.version,profiles:[]};
for(const p of manifest.profiles){
  const resources={};
  for(const b of p.recipe.bindings) resources[b.path]=fs.readFileSync(path.join(base,'upstream',b.path)).toString('hex');
  const k=new NativeRecipeKernel(p.recipe,resources);
  const entry={id:p.id,recipe_sha256:k.profile_sha256,binary_state_audit:k.binary_state_audit,
    bootstrap_sha256:sha(k.read()),initial_projection_hex:k.projection().toString('hex'),events:[]};
  for(let i=0;i<4;i++){
    const receipt=k.advance();
    entry.events.push({...receipt,projection_hex:k.projection().toString('hex')});
  }
  report.profiles.push(entry);
  process.stdout.write(JSON.stringify({id:p.id,bootstrap:entry.bootstrap_sha256,events:entry.events.length,last:entry.events.at(-1).full_memory_sha256})+'\n');
}
fs.writeFileSync(path.join(base,'tests/golden.json'),JSON.stringify(report,null,2)+'\n');
