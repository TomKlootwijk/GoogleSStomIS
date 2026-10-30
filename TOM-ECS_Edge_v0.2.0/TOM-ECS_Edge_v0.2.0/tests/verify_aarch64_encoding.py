#!/usr/bin/env python3
"""Compare the emitter's ARM64 opcodes to independent assemblers/disassemblers.

Optional validation-only dependencies: capstone==5.0.9, keystone-engine==0.9.2.
This checks instruction encoding and PC-relative offsets; it does not execute
the Android binary, validate OS JIT policy, or measure phone performance.
"""
import json
from pathlib import Path
import re
import struct

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN
from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN

source = (Path(__file__).resolve().parents[1] / "core" / "jit.cpp").read_text()
assembler = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
disassembler = Cs(CS_ARCH_ARM64, CS_MODE_LITTLE_ENDIAN)
checks = 0


def source_word(comment):
    match = re.search(r"u32\(bytes, (0x[0-9a-f]+)U\);\s*// " + re.escape(comment), source)
    if not match:
        raise AssertionError("Emitter source pattern changed: " + comment)
    return int(match.group(1), 16)


def compare(word, assembly, address=0):
    global checks
    expected, _ = assembler.asm(assembly, addr=address)
    assert struct.pack("<I", word) == bytes(expected), (hex(word), assembly, address)
    checks += 1


compare(source_word("fmul d1,d1,d2"), "fmul d1, d1, d2")
compare(source_word("fadd d0,d0,d1"), "fadd d0, d0, d1")
compare(source_word("ret"), "ret")
bti = source_word("bti c")
decoded = list(disassembler.disasm(struct.pack("<I", bti), 0))
assert len(decoded) == 1 and decoded[0].mnemonic == "bti" and decoded[0].op_str == "c"
checks += 1

load_match = re.search(r"u32\(bytes, (0x[0-9a-f]+)U \|.*// ldr d1,\[x0,#8\*i\]", source)
assert load_match, "Load emitter pattern changed"
load = int(load_match.group(1),16)
for i in range(16):
    compare(load | (i << 10), f"ldr d1, [x0, #{i * 8}]")

literal_match = re.search(r"patch32\(bytes, ref.at, (0x[0-9a-f]+)U \| \(displacement << 5\) \| rt\)", source)
assert literal_match, "Literal patch pattern changed"
literal_base = int(literal_match.group(1),16)
for features in range(1,17):
    code_end = 4 + 4 + features * 16 + 4  # BTI, bias LDR, four instructions/feature, RET.
    pool = (code_end + 7) // 8 * 8
    addresses = [4] + [12 + 16 * i for i in range(features)]
    for index, pc in enumerate(addresses):
        target = pool + index * 8
        register = 0 if index == 0 else 2
        word = literal_base | (((target - pc) // 4) << 5) | register
        compare(word, f"ldr d{register}, {target}", pc)

print(json.dumps({"status":"passed", "checks":checks,
    "scope":"AArch64 scalar opcodes and literal-pool offsets against Keystone/Capstone",
    "android_device_execution":False}, indent=2))
