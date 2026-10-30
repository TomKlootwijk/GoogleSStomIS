#!/usr/bin/env python3
"""Deterministic TOM-ECS/1 packer/inspector; Python standard library only.

The format is an envelope for admitted native phone operators, not a compiler
for arbitrary downloaded code and not XD-ECS/11 conformance. See docs/format.md.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

MAGIC = b"TOMECS1\0"
MAX_BYTES = 16 * 1024 * 1024
EVENT = struct.Struct("<QIIQIIHHIQ")
ENTITY = struct.Struct("<IIIIQQQQ")
COMPONENT = struct.Struct("<IHHQ")
CONFIG = struct.Struct("<IIIIQQQQQQ")
DIRECTORY = struct.Struct("<IIQQII32s")
NAMES = {1: "manifest", 2: "config64", 3: "entity48", 4: "component16",
         5: "event48", 6: "source8", 7: "tomagi_1_0", 8: "lognet_planes",
         9: "lognet_validity", 10: "native_binding48"}
OPCODES = {"set": 1, "add_wrap": 2, "add_checked": 3, "xor": 4,
           "copy": 5, "pair_act_rewrite": 6, "destroy": 7, "spawn": 8,
           "d6_lookup": 9, "tomagi_step": 256, "native_profile_step": 512}


def canonical_json(value: object) -> bytes:
    def check(v: object) -> None:
        if isinstance(v, float):
            raise ValueError("floating-point values are outside the package manifest contract")
        if isinstance(v, dict):
            if not all(isinstance(k, str) for k in v):
                raise ValueError("manifest object keys must be strings")
            for entry in v.values(): check(entry)
        elif isinstance(v, list):
            for entry in v: check(entry)
    check(value)
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"),
                      allow_nan=False).encode("utf-8")


def uint(value: object, width: int, field: str) -> int:
    if type(value) is not int or value < 0 or value >= 1 << width:
        raise ValueError(f"{field} must be uint{width}")
    return value


def pack_sections(sections: list[tuple[int, bytes, int, int]]) -> bytes:
    if not 6 <= len(sections) <= 10 or [s[0] for s in sections] != sorted(set(s[0] for s in sections)):
        raise ValueError("sections must be unique, sorted, with 6..10 entries")
    output = bytearray(96 + 64 * len(sections))
    for i, (kind, payload, count, stride) in enumerate(sections):
        output.extend(b"\0" * (-len(output) % 8))
        offset = len(output)
        output.extend(payload)
        DIRECTORY.pack_into(output, 96 + 64 * i, kind, 0, offset, len(payload), count, stride,
                            hashlib.sha256(payload).digest())
    if len(output) > MAX_BYTES: raise ValueError("package exceeds 16 MiB profile limit")
    struct.pack_into("<8sHHIQII", output, 0, MAGIC, 1, 0, 96, len(output), len(sections), 64)
    output[32:64] = hashlib.sha256(output).digest()
    return bytes(output)


def read_asset(base: Path, path: str, cap: int) -> bytes:
    target = (base / path).resolve()
    if not target.is_file() or target.stat().st_size > cap:
        raise ValueError(f"missing or oversized local asset: {path}")
    return target.read_bytes()


def pack_spec(spec: dict, base: Path) -> bytes:
    cfg = spec["config"]
    ec, cc, qc, sc = [uint(cfg[k], 32, k) for k in
                       ("entity_capacity", "component_count", "event_capacity", "source_capacity")]
    if not (1 <= ec <= 1024 and 16 <= cc <= 64 and ec * cc <= 65536 and
            1 <= qc <= 65536 and 1 <= sc <= 32): raise ValueError("capacity outside phone-v1 limits")
    through = uint(cfg["commit_through"], 64, "commit_through")
    caps = uint(cfg.get("capabilities", 31), 64, "capabilities")
    budget_events = uint(cfg["max_events"], 64, "max_events")
    budget_ops = uint(cfg["max_operations"], 64, "max_operations")
    if caps & ~31 or budget_events > 65536 or budget_ops > 10000000:
        raise ValueError("invalid capabilities or work budget")
    entities = spec["entities"]
    if len(entities) > ec: raise ValueError("too many entities")
    eb = bytearray()
    for slot, entity in enumerate(entities):
        r = entity.get("rule", {})
        version = uint(r.get("version", 1), 64, "rule version")
        if version == 0: raise ValueError("rule version cannot be zero")
        eb.extend(ENTITY.pack(slot, 1, int(entity.get("tomagi_initial", False)), 0,
                              uint(r.get("act_addend", 0), 64, "act addend"),
                              uint(r.get("rewrite_xor", 0), 64, "rewrite xor"), version, 0))
    components = sorted(spec["components"], key=lambda c: (c[0], c[1]))
    cb = bytearray()
    previous = None
    for entry in components:
        if len(entry) != 3: raise ValueError("components must be [entity,component,value]")
        slot, component, value = [uint(v, w, "component field") for v, w in zip(entry, (32,16,64))]
        if slot >= len(entities) or component >= cc or previous == (slot, component):
            raise ValueError("invalid or duplicate component")
        cb.extend(COMPONENT.pack(slot, component, 0, value)); previous = (slot, component)
    events = sorted(spec["events"], key=lambda e: (e["tick"], e["source"], e["sequence"]))
    vb = bytearray(); previous = None
    for e in events:
        op = e["opcode"]
        if isinstance(op, str): op = OPCODES[op]
        values = (e["tick"], e["source"], e.get("source_epoch", 0), e["sequence"],
                  e["entity"], e.get("generation", 1), op, e.get("component", 0), 0, e.get("argument", 0))
        for v, w in zip(values, (64,32,32,64,32,32,16,16,32,64)): uint(v, w, "event field")
        key = (e["tick"], e["source"], e["sequence"])
        if key == previous or e["tick"] > through or e["source"] >= sc:
            raise ValueError("invalid duplicate/event frontier/source")
        vb.extend(EVENT.pack(*values)); previous = key
    if len(events) > qc: raise ValueError("event capacity exceeded")
    epochs = spec.get("source_epochs", [0] * sc)
    if len(epochs) != sc: raise ValueError("source epoch count mismatch")
    source_data = b"".join(struct.pack("<II", i, uint(epoch, 32, "source epoch"))
                           for i, epoch in enumerate(epochs))
    manifest = canonical_json(spec["manifest"])
    if not 1 <= len(manifest) <= 1024 * 1024: raise ValueError("manifest outside byte limit")
    sections = [(1, manifest, 1, 0),
                (2, CONFIG.pack(ec, cc, qc, sc, through, caps, budget_events, budget_ops, 0, 0), 1, 64),
                (3, bytes(eb), len(entities), 48), (4, bytes(cb), len(components), 16),
                (5, bytes(vb), len(events), 48), (6, source_data, sc, 8)]
    if "tomagi" in spec:
        sections.append((7, read_asset(base, spec["tomagi"], MAX_BYTES), 1, 0))
    if "lognet_planes" in spec or "lognet_validity" in spec:
        planes = read_asset(base, spec["lognet_planes"], 2448)
        mask = read_asset(base, spec["lognet_validity"], 153)
        if len(planes) != 2448 or len(mask) != 153: raise ValueError("wrong source LUT dimensions")
        sections.extend([(8, planes, 1, 0), (9, mask, 1, 0)])
    if "native_bindings" in spec:
        bindings=sorted(spec["native_bindings"],key=lambda b:b["entity"])
        if len(bindings)>8: raise ValueError("at most eight native profiles per device package")
        data=bytearray(); previous=None
        for binding in bindings:
            slot=uint(binding["entity"],32,"native entity")
            index=uint(binding["profile_index"],32,"native profile index")
            if slot>=len(entities) or slot==previous: raise ValueError("invalid native binding entity")
            identity="TNM-PROFILE/1\n"+"\n".join(binding[k] for k in
                ("profile_id","wasm_sha256","recipe_sha256","bootstrap_sha256"))+"\n"
            data.extend(struct.pack("<II32sQ",slot,index,hashlib.sha256(identity.encode("ascii")).digest(),0))
            previous=slot
        sections.append((10,bytes(data),len(bindings),48))
    return pack_sections(sections)


def inspect(blob: bytes) -> dict:
    if not 96 <= len(blob) <= MAX_BYTES: raise ValueError("invalid file size")
    magic, major, minor, hsize, length, count, dsize = struct.unpack_from("<8sHHIQII", blob)
    if (magic,major,minor,hsize,dsize) != (MAGIC,1,0,96,64) or length != len(blob):
        raise ValueError("invalid framing")
    if not 6 <= count <= 10 or len(blob) < 96 + count * 64 or any(blob[64:96]):
        raise ValueError("invalid header/directory")
    root = hashlib.sha256(blob[:32] + b"\0"*32 + blob[64:]).hexdigest()
    if root != blob[32:64].hex(): raise ValueError("root digest mismatch")
    entries=[]; previous=0; end=96+count*64; manifest=None
    for i in range(count):
        kind, flags, offset, size, n, stride, sha = DIRECTORY.unpack_from(blob, 96+i*64)
        if kind <= previous or kind not in NAMES or flags != 0 or offset != (end+7)//8*8:
            raise ValueError("noncanonical directory")
        if offset > len(blob) or size > len(blob)-offset or any(blob[end:offset]):
            raise ValueError("section bounds/padding")
        data=blob[offset:offset+size]
        if (stride and n*stride != size) or (not stride and n != 1): raise ValueError("section dimensions")
        if hashlib.sha256(data).digest() != sha: raise ValueError("section digest mismatch")
        if kind == 1:
            manifest=json.loads(data)
            if canonical_json(manifest) != data: raise ValueError("manifest is not canonical JSON")
        entries.append(dict(type=kind,name=NAMES[kind],offset=offset,bytes=size,count=n,stride=stride,sha256=sha.hex()))
        previous=kind; end=offset+size
    if end != len(blob) or not set(range(1,7)).issubset(e["type"] for e in entries):
        raise ValueError("missing section or trailing bytes")
    return dict(format="TOM-ECS/1",bytes=len(blob),package_sha256=root,sections=entries,manifest=manifest,
                validation="framing+hashes; use native replay for semantic validation")


def main() -> int:
    parser=argparse.ArgumentParser(description=__doc__)
    sub=parser.add_subparsers(dest="command",required=True)
    p=sub.add_parser("pack");p.add_argument("spec",type=Path);p.add_argument("--out",type=Path,required=True)
    p=sub.add_parser("inspect");p.add_argument("file",type=Path)
    args=parser.parse_args()
    try:
        if args.command == "pack":
            spec=json.loads(args.spec.read_text(encoding="utf-8"))
            blob=pack_spec(spec,args.spec.resolve().parent)
            args.out.parent.mkdir(parents=True,exist_ok=True);args.out.write_bytes(blob)
            print(json.dumps({"file":str(args.out),"bytes":len(blob),"package_sha256":blob[32:64].hex()}))
        else:
            if args.file.stat().st_size > MAX_BYTES: raise ValueError("package too large")
            print(json.dumps(inspect(args.file.read_bytes()),ensure_ascii=False,indent=2))
    except (ValueError,KeyError,TypeError,OSError,struct.error) as exc:
        print(f"TOM-ECS: {exc}",file=sys.stderr);return 1
    return 0


if __name__ == "__main__": raise SystemExit(main())
