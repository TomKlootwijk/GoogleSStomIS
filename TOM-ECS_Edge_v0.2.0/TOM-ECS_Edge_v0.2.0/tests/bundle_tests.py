#!/usr/bin/env python3
"""Adversarial TOM-ECS/1 framing and semantic tests against the native parser.

Malformed semantic fixtures are rebuilt with VALID section/root SHA256 values,
so tests exercise validation rather than relying only on corrupted checksums.
"""
from __future__ import annotations
import argparse
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("tom_ecs_packer", ROOT / "tools/tom_ecs.py")
packer = importlib.util.module_from_spec(spec)
spec.loader.exec_module(packer)


def sections(blob):
    result=[]
    for i in range(struct.unpack_from("<I",blob,24)[0]):
        kind,flags,offset,size,count,stride,digest=packer.DIRECTORY.unpack_from(blob,96+i*64)
        result.append((kind,blob[offset:offset+size],count,stride))
    return result


def replace(blob,kind,payload,count=None,stride=None):
    items=sections(blob)
    for i,(t,data,n,s) in enumerate(items):
        if t==kind:
            items[i]=(t,bytes(payload),n if count is None else count,s if stride is None else stride)
            return packer.pack_sections(items)
    raise AssertionError("Missing fixture section")


def change(blob,kind,offset,fmt,value):
    data=bytearray(next(s[1] for s in sections(blob) if s[0]==kind))
    struct.pack_into(fmt,data,offset,value)
    return replace(blob,kind,data)


def root_hash(blob):
    data=bytearray(blob);data[32:64]=b"\0"*32;data[32:64]=hashlib.sha256(data).digest();return bytes(data)


def raw_change(blob,offset,fmt,value):
    data=bytearray(blob);struct.pack_into(fmt,data,offset,value);return root_hash(data)


def main():
    parser=argparse.ArgumentParser();parser.add_argument("--binary",type=Path,required=True)
    parser.add_argument("--report",type=Path);args=parser.parse_args()
    binary=args.binary.resolve();cases=[]
    base_spec={
        "manifest":{"fixture":"parser adversarial validation","format":"TOM-ECS/1"},
        "config":{"entity_capacity":4,"component_count":16,"event_capacity":8,"source_capacity":2,
            "commit_through":2,"capabilities":31,"max_events":8,"max_operations":100000},
        "entities":[{"rule":{"act_addend":2}},{"tomagi_initial":True}],
        "components":[[0,0,10]],"source_epochs":[0,0],
        "events":[
            {"tick":1,"source":0,"sequence":1,"entity":0,"opcode":"pair_act_rewrite","argument":1},
            {"tick":1,"source":1,"sequence":1,"entity":1,"opcode":"tomagi_step"},
            {"tick":2,"source":0,"sequence":2,"entity":0,"opcode":"pair_act_rewrite"},
            {"tick":2,"source":1,"sequence":2,"entity":1,"opcode":"tomagi_step"}],
        "tomagi":"ecs/vendor/tomk/examples/exact19_rule.tmg",
        "lognet_planes":"assets/lognet/hex_q16_bitplanes.bin",
        "lognet_validity":"assets/lognet/hex_validity_bits.bin"}
    base=packer.pack_spec(base_spec,ROOT)
    with tempfile.TemporaryDirectory(prefix="tom-ecs-test-") as temporary:
        path=Path(temporary)/"case.tecs"
        def check(name,blob,ok=False,predicate=None):
            path.write_bytes(blob)
            proc=subprocess.run([str(binary),str(path)],text=True,capture_output=True,timeout=30)
            assert "runtime error:" not in proc.stderr and "Sanitizer" not in proc.stderr, (name,proc.stderr)
            data=json.loads(proc.stdout) if proc.stdout.strip() else {"ok":False,"error":proc.stderr.strip()}
            actual=data.get("ok") is True
            assert actual==ok,(name,proc.returncode,data)
            if ok:
                assert proc.returncode==0 and data["replay_equal"] is True,(name,data)
            else:assert proc.returncode in (1,2),(name,"abnormal termination",proc.returncode,proc.stderr)
            if predicate:assert predicate(data),(name,data)
            cases.append({"name":name,"passed":True,"accepted":actual})
            return data

        original=check("baseline source-backed execution",base,True,lambda d:d["applied"]==4 and d["rejected"]==0)
        check("empty input",b"")
        check("truncated header",base[:95])
        check("bad magic with valid root hash",raw_change(base,0,"<B",0))
        for offset,fmt,value,label in [(8,"<H",2,"major version"),(10,"<H",1,"minor version"),
                (12,"<I",88,"header size"),(16,"<Q",len(base)+1,"declared length"),
                (24,"<I",0,"zero directory count"),(24,"<I",0xffffffff,"huge directory count"),
                (28,"<I",63,"directory stride"),(64,"<B",1,"header reserved")]:
            check(label,raw_change(base,offset,fmt,value))
        broken=bytearray(base);broken[32]^=1;check("root checksum corruption",bytes(broken))
        broken=bytearray(base);broken[-1]^=1;check("payload mutation with recomputed root only",root_hash(broken))
        for offset,fmt,value,label in [(96,"<I",65535,"unknown section type"),(160,"<I",1,"duplicate section"),
                (100,"<I",1,"unknown section flags"),(104,"<Q",0,"overlapping section"),
                (104,"<Q",0xffffffffffffffff,"huge section offset"),
                (112,"<Q",0xffffffffffffffff,"huge section length"),
                (120,"<I",2,"opaque section count"),(124,"<I",1,"record dimensions")]:
            check(label,raw_change(base,offset,fmt,value))
        trailing=bytearray(base+b"x");struct.pack_into("<Q",trailing,16,len(trailing));check("trailing bytes",root_hash(trailing))
        for i in range(struct.unpack_from("<I",base,24)[0]-1):
            _,_,offset,size,_,_,_=packer.DIRECTORY.unpack_from(base,96+i*64)
            next_offset=packer.DIRECTORY.unpack_from(base,96+(i+1)*64)[2]
            if next_offset>offset+size:
                check("nonzero alignment padding",raw_change(base,offset+size,"<B",1));break
        check("missing required configuration",packer.pack_sections([s for s in sections(base) if s[0]!=2]))
        check("missing paired LUT mask",packer.pack_sections([s for s in sections(base) if s[0]!=9]))
        # Manifest is intentionally uninterpreted metadata in the native API.
        opaque=replace(base,1,b"non-JSON metadata with no execution authority")
        check("opaque metadata is not parsed or executed",opaque,True,lambda d:d["applied"]==4)
        try:packer.inspect(opaque)
        except (ValueError,json.JSONDecodeError):pass
        else:raise AssertionError("Python canonical JSON authoring inspection accepted opaque metadata")
        for offset,fmt,value,label in [(0,"<I",0,"zero entities capacity"),(0,"<I",1025,"entity capacity bound"),
                (4,"<I",15,"component minimum"),(4,"<I",65,"component bitset bound"),
                (8,"<I",0,"zero event capacity"),(8,"<I",65537,"event capacity bound"),
                (12,"<I",0,"zero source capacity"),(12,"<I",33,"source capacity bound"),
                (24,"<Q",1<<40,"unknown capabilities"),(32,"<Q",65537,"event work bound"),
                (40,"<Q",10000001,"operation work bound"),(48,"<Q",1,"config reserved")]:
            check(label,change(base,2,offset,fmt,value))
        check("insufficient event budget",change(base,2,32,"<Q",3))
        check("insufficient operation budget",change(base,2,40,"<Q",0))
        check("capability-denied events produce rejection receipts",change(base,2,24,"<Q",0),True,
              lambda d:d["applied"]==0 and d["rejected"]==4)
        for offset,fmt,value,label in [(0,"<I",1,"non-dense entity slot"),(4,"<I",0,"zero entity generation"),
                (8,"<I",2,"entity flags"),(12,"<I",1,"entity reserved"),
                (32,"<Q",0,"zero rule version"),(40,"<Q",1,"rule reserved")]:
            check(label,change(base,3,offset,fmt,value))
        for offset,fmt,value,label in [(0,"<I",3,"component unknown entity"),(4,"<H",16,"component slot overflow"),
                (6,"<H",1,"component reserved")]:check(label,change(base,4,offset,fmt,value))
        component_data=next(s[1] for s in sections(base) if s[0]==4)
        check("duplicate component rows",replace(base,4,component_data*2,count=2))
        check("source ids not dense",change(base,6,0,"<I",1))
        event_data=next(s[1] for s in sections(base) if s[0]==5)
        reordered=event_data[48:96]+event_data[:48]+event_data[96:]
        check("reordered binary events rejected",replace(base,5,reordered))
        check("duplicate ordered event key",replace(base,5,event_data[:48]+event_data,count=5))
        for offset,fmt,value,label in [(0,"<Q",3,"event beyond frontier"),(8,"<I",2,"unknown event source"),
                (12,"<I",1,"source epoch mismatch"),(24,"<I",4,"event entity capacity bound"),
                (28,"<I",0,"zero event generation"),(32,"<H",65535,"unknown event opcode"),
                (34,"<H",16,"event component overflow"),(36,"<I",1,"event reserved flags")]:
            check(label,change(base,5,offset,fmt,value))
        check("stale generation retained as rejected event",change(base,5,28,"<I",2),True,
              lambda d:d["applied"]==3 and d["rejected"]==1)
        # Valid packed source program with an invalid RADIX operand: source
        # returns a failure; the ECS records rejection and retains state.
        program=bytearray(next(s[1] for s in sections(base) if s[0]==7))
        struct.pack_into("<I",program,128+8,10);struct.pack_into("<i",program,128+16,64)
        check("original source instruction failure is transactional",replace(base,7,program),True,
              lambda d:d["applied"]==2 and d["rejected"]==2)
        for offset,fmt,value,label in [(8,"<I",2,"TOMAGI version"),(16,"<I",0xffffffff,"TOMAGI huge cell count"),
                (20,"<I",3,"TOMAGI entry bound"),(40,"<I",1,"TOMAGI reserved"),
                (128+8,"<I",16,"TOMAGI unknown opcode"),(128+32,"<I",3,"TOMAGI successor bound")]:
            check(label,change(base,7,offset,fmt,value))
        check("TOMAGI truncated payload",replace(base,7,next(s[1] for s in sections(base) if s[0]==7)[:-1]))
        check("LUT asymmetric but correctly hashed",change(base,8,0,"<B",next(s[1] for s in sections(base) if s[0]==8)[0]^128))
        check("native binding unavailable index",packer.pack_sections(sections(base)+[(10,struct.pack("<II32sQ",0,0xffffffff,b"\0"*32,0),1,48)]))
        check("native binding wrong profile fingerprint",packer.pack_sections(sections(base)+[(10,struct.pack("<II32sQ",0,0,b"\0"*32,0),1,48)]))
        check("native binding reserved bits",packer.pack_sections(sections(base)+[(10,struct.pack("<II32sQ",0,0,b"\0"*32,1),1,48)]))
        # Packer canonicalization, unlike the binary parser, accepts authoring
        # event permutations and emits exactly the same complete package.
        shuffled=copy.deepcopy(base_spec);shuffled["events"].reverse()
        assert packer.pack_spec(shuffled,ROOT)==base
        cases.append({"name":"authoring permutation yields identical package bytes","passed":True,"accepted":True})
        lifecycle=copy.deepcopy(base_spec);lifecycle["entities"]=[{}];lifecycle["components"]=[]
        lifecycle["events"]=[{"tick":1,"source":0,"sequence":1,"entity":0,"opcode":"destroy"},
            {"tick":2,"source":0,"sequence":2,"entity":0,"generation":2,"opcode":"spawn"},
            {"tick":2,"source":0,"sequence":3,"entity":0,"generation":2,"opcode":"set","argument":9}]
        check("summary follows new entity generation",packer.pack_spec(lifecycle,ROOT),True,
              lambda d:d["applied"]==3 and d["live_components"]==1)
        spawned=copy.deepcopy(base_spec);spawned["entities"]=[];spawned["components"]=[]
        spawned["events"]=[{"tick":1,"source":0,"sequence":1,"entity":3,"opcode":"spawn"},
            {"tick":2,"source":0,"sequence":2,"entity":3,"opcode":"set","argument":2}]
        check("summary includes dynamically spawned entity",packer.pack_spec(spawned,ROOT),True,
              lambda d:d["applied"]==2 and d["live_components"]==1)
        partial=copy.deepcopy(base_spec)
        partial["events"]=[{"tick":1,"source":0,"sequence":1,"entity":1,"opcode":"d6_lookup",
                            "component":0,"argument":16<<32}]
        check("partial TOMAGI state does not invalidate successful publication",packer.pack_spec(partial,ROOT),True,
              lambda d:d["applied"]==1 and d["incomplete_tomagi_states"]==1)
        report={"status":"passed","checks":len(cases),"scope":"native parser framing, rehashed semantic adversaries, source failure and lifecycle summaries",
            "baseline_state_sha256":original["state_sha256"],"cases":cases,
            "android_execution":False,"fuzzing_claim":"finite explicit adversaries; not exhaustive fuzzing"}
    if args.report:
        args.report.parent.mkdir(parents=True,exist_ok=True);args.report.write_text(json.dumps(report,indent=2)+"\n")
    print(json.dumps({"status":"passed","checks":len(cases)},indent=2))
    return 0


if __name__=="__main__":raise SystemExit(main())
