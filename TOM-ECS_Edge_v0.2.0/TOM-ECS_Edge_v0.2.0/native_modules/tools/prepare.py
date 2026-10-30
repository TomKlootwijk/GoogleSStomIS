#!/usr/bin/env python3
"""Reproduce the admitted native profile inputs from a pinned local checkout.

Does not fetch network resources or execute model code. Validates hashes before
copying original bytes, invokes a supplied official wasm-validate/wasm2c binary,
and records exact input/output identities. Source golden execution is separate.
"""
import argparse, hashlib, json, pathlib, shutil, subprocess

PROFILE_IDS = [
    "tomk.exact19.data-bit-lut-v1",
    "tomgrok.pinion.default.data-bit-lut-v1",
    "maktub.mirror.data-bit-lut-v1",
    "maktubiii.paired.QIS2.data-bit-lut-v1",
    "jtk.slog2.quarterturn.data-bit-lut-v1",
    "tk.selected-quarterturn.data-bit-lut-v1",
    "xd.physics.rational8192.bit-data-v1",
    "xd.parent.parity6.native-v1",
]
MODULES = {
    "software/tomk_bit_complete/tomagi.wasm": "tomagi",
    "software/pinion_bit_exact/pinion_maktub.wasm": "pinion",
    "software/maktubiii_bit_exact/maktubiii.wasm": "maktubiii",
    "software/twin_bit_exact/twin.wasm": "twin",
    "software/xd_rational_bit_exact/physics.wasm": "physics",
    "software/xd_lut_machine/machine.wasm": "machine",
}
REVISION = "9823c27edf9a7e84c5a10b28b1970a22e69abf39"
def digest(b): return hashlib.sha256(b).hexdigest()
def canonical(o): return json.dumps(o, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--source", type=pathlib.Path, required=True)
    ap.add_argument("--wabt", type=pathlib.Path, required=True)
    args=ap.parse_args()
    dest=pathlib.Path(__file__).resolve().parents[1]
    src=args.source.resolve(); wabt=args.wabt.resolve()
    registry_path="language/xd_ecs_hop_suite/registry.json"
    registry_bytes=(src/registry_path).read_bytes()
    assert digest(registry_bytes)=="bf0902088979c93b7d82008ceb18dc08b1ed7ecf94380f66d0edd5655ab44db5"
    registry=json.loads(registry_bytes)
    manifest={"schema":"TNM-NATIVE-SOURCES/1", "repository":"c0mbatduckzz/TNOMTOM",
      "revision":REVISION,"registry_path":registry_path,"registry_sha256":digest(registry_bytes),
      "wabt_version":"1.0.42","wabt_archive_sha256":"84895407a6bbb80e918f33b16b2fb2206021c150b6bc9ff6f761263a745ab131",
      "profiles":[],"retained_originals":[],"generated_files":[]}
    def copy(rel):
        p=pathlib.PurePosixPath(rel)
        assert not p.is_absolute() and ".." not in p.parts
        original=(src/p).read_bytes()
        target=dest/"upstream"/p; target.parent.mkdir(parents=True,exist_ok=True)
        target.write_bytes(original)
        manifest["retained_originals"].append({"path":str(target.relative_to(dest)),"source_path":rel,
          "bytes":len(original),"sha256":digest(original),
          "url":f"https://huggingface.co/c0mbatduckzz/TNOMTOM/blob/{REVISION}/{rel}"})
    copy(registry_path)
    copy("language/xd_ecs_v2/native_recipe.mjs")
    copy("README.md")
    bound={}
    for pid in PROFILE_IDS:
        p=registry["profiles"][pid]; recipe=p["recipe"]
        assert digest(canonical(recipe).encode())==p["recipe_sha256"]
        for b in recipe["bindings"]:
            data=(src/b["path"]).read_bytes()
            assert len(data)==int(b["bytes"]) and digest(data)==b["sha256"],b["path"]
            bound[b["path"]]=b
        manifest["profiles"].append({"id":pid,"recipe_sha256":p["recipe_sha256"],
          "module_name":MODULES[recipe["module"]],"recipe":recipe})
    for path in sorted(bound): copy(path)
    for path,name in MODULES.items():
        parent=pathlib.PurePosixPath(path).parent
        for leaf in ["README.md","ABI.md","SPEC.md",pathlib.PurePosixPath(path).stem+".wat"]:
            rel=str(parent/leaf)
            if (src/rel).is_file(): copy(rel)
        subprocess.run([str(wabt/"bin/wasm-validate"),str(dest/"upstream"/path)],check=True)
        obj=subprocess.check_output([str(wabt/"bin/wasm-objdump"),"-x",str(dest/"upstream"/path)],text=True)
        # Original adapter independently enforces no imports/globals/tables/segments.
        assert "Import[" not in obj and "Global[" not in obj and "Table[" not in obj and "Data[" not in obj
        (dest/"generated"/(name+".objdump.txt")).write_text(obj)
        subprocess.run([str(wabt/"bin/wasm2c"),str(dest/"upstream"/path),"-n",name,
                        "-o",str(dest/"generated"/(name+".c"))],check=True)
    for leaf in ["wasm-rt.h","wasm-rt-exceptions.h"]:
        shutil.copyfile(wabt/"include"/leaf,dest/"runtime"/leaf)
    for p in sorted((wabt/"share/wabt/wasm2c").iterdir()):
        if p.is_file(): shutil.copyfile(p,dest/"runtime"/p.name)
    # Retain original Apache-licensed runtime separately before this one local
    # embedding patch. Finite admitted modules use malloc, not mmap/signals.
    original_runtime=dest/"upstream/wabt-runtime"
    original_runtime.mkdir(parents=True,exist_ok=True)
    for p in sorted((dest/"runtime").glob("wasm-rt*")):
        shutil.copyfile(p,original_runtime/p.name)
    helper=dest/"runtime/wasm-rt-mem-impl-helper.inc"
    text=helper.read_text(); old='if (byte_length != 0 && !memory->data) {\n    abort();\n  }'
    assert text.count(old)==1
    helper.write_text(text.replace(old,'if (byte_length != 0 && !memory->data) {\n    /* Local embedding patch: return control to create() on allocation failure. */\n    wasm_rt_trap(WASM_RT_TRAP_EXHAUSTION);\n  }'))
    for p in sorted((dest/"generated").glob("*")):
        manifest["generated_files"].append({"path":str(p.relative_to(dest)),"sha256":digest(p.read_bytes()),"bytes":p.stat().st_size})
    (dest/"source_manifest.json").write_text(json.dumps(manifest,indent=2,ensure_ascii=False)+"\n")
    print(json.dumps({"profiles":len(PROFILE_IDS),"kernels":len(MODULES),"originals":len(manifest["retained_originals"])}))
if __name__=="__main__": main()
