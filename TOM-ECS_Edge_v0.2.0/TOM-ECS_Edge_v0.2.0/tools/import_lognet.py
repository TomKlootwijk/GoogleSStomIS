#!/usr/bin/env python3
"""Import the documented log net D payload from the supplied master PDF.

Requires pypdf. Does not execute any Python or other code in the attachment.
Validates the attachment manifest and the mathematical data independently,
then writes only the four numeric payloads plus minimal source metadata.
"""

from __future__ import annotations

import argparse
import hashlib
import io
import json
from pathlib import Path, PurePosixPath
import stat
import zipfile

from pypdf import PdfReader


BINARY_NAMES = (
    "hex_q16_bitplanes.bin",
    "hex_validity_bits.bin",
    "log2_levels_bitmatrix.bin",
    "coordinate_frames.bin",
)
TURN = 360_000_000_000
FIELDS = (
    ("latitude_phi_word", 40),
    ("longitude_lambda_word", 40),
    ("height_mm_word", 64),
    ("theta_word", 39),
    ("winding_word", 32),
    ("valid_bit", 1),
    ("longitude_defined_bit", 1),
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def bits(data: bytes) -> str:
    return "".join(f"{value:08b}" for value in data)


def uint(word: str, width: int | None = None) -> int:
    require(isinstance(word, str) and bool(word), "Expected a binary string")
    require(set(word) <= {"0", "1"}, "Invalid bit character")
    require(width is None or len(word) == width, "Wrong binary word width")
    return int(word, 2)


def sint(word: str, width: int) -> int:
    value = uint(word, width)
    return value - (1 << width) if word[0] == "1" else value


def bit_json(value: object) -> None:
    if value is None or isinstance(value, str):
        return
    if type(value) is int and value in (0, 1):
        return
    if isinstance(value, list):
        for item in value:
            bit_json(item)
        return
    if isinstance(value, dict) and all(isinstance(key, str) for key in value):
        for item in value.values():
            bit_json(item)
        return
    raise ValueError("Canonical source JSON numeric literals must be 0 or 1")


def unpack_zip(data: bytes) -> dict[str, bytes]:
    require(len(data) <= 64 * 1024 * 1024, "Embedded ZIP exceeds import limit")
    with zipfile.ZipFile(io.BytesIO(data)) as archive:
        entries = archive.infolist()
        require(len(entries) <= 256, "Too many ZIP entries")
        require(sum(entry.file_size for entry in entries) <= 64 * 1024 * 1024,
                "Expanded attachment exceeds import limit")
        result = {}
        for entry in entries:
            name = entry.filename
            require(not entry.is_dir(), "Flat attachment files required")
            require(PurePosixPath(name).name == name and "\\" not in name,
                    "Unsafe ZIP entry path")
            require(not stat.S_ISLNK(entry.external_attr >> 16), "ZIP links rejected")
            require(name not in result, "Duplicate ZIP entry")
            result[name] = archive.read(entry)
        return result


def validate(files: dict[str, bytes]) -> tuple[dict, dict]:
    manifest = json.loads(files["universal_bundle_manifest.json"])
    legacy = json.loads(files["legacy_hex_binary.json"])
    packet = json.loads(files["log_net_D_universal_bits.json"])
    for item in (manifest, legacy, packet):
        bit_json(item)

    checked_names = set()
    for entry in manifest["files"]:
        name = entry["name"]
        require(PurePosixPath(name).name == name and "\\" not in name,
                "Unsafe manifest path")
        require(name not in checked_names, "Duplicate manifest entry")
        data = files[name]
        require(len(data) == uint(entry["byte_count_bits"]), f"Wrong size: {name}")
        require(sha256(data) == entry["sha256"], f"SHA256 mismatch: {name}")
        checked_names.add(name)
    require(set(BINARY_NAMES) <= checked_names, "Unmanifested binary data")

    require(legacy["profile_id"] == "LND_HEX_Q16_BITS_V1", "Unknown LUT profile")
    words = legacy["q16_words_msb"]
    mask = legacy["validity_bitplane"]
    require(len(words) == len(mask) == 17, "Expected 17 radial rows")
    require(all(len(row) == 72 for row in words + mask), "Expected 72 angular nodes")
    qbits = bits(files["hex_q16_bitplanes.bin"])
    mbits = bits(files["hex_validity_bits.bin"])
    require(len(qbits) == 16 * 17 * 72 and len(mbits) == 17 * 72,
            "Packed LUT length mismatch")
    require(mbits.count("1") == 1158 and mbits.count("0") == 66,
            "Wrong valid/invalid node counts")
    expected_qbits = "".join(str(legacy["q16_bitplanes_msb"][p][r][j])
                             for p in range(16) for r in range(17) for j in range(72))
    require(qbits == expected_qbits, "Packed bitplanes differ from canonical JSON")
    qvalues = []
    for row in range(17):
        decoded = []
        for col in range(72):
            index = row * 72 + col
            word = "".join(qbits[plane * 1224 + index] for plane in range(16))
            require(word == words[row][col], "Packed Q16 word mismatch")
            require(mbits[index] == str(mask[row][col]), "Packed mask mismatch")
            q = uint(word, 16)
            require(mask[row][col] == 1 or q == 0, "Invalid node has nonzero payload")
            decoded.append(q)
        qvalues.append(decoded)

    # Independently enumerate all twelve D6 actions over all stored nodes.
    node_checks = 0
    for reflection in (0, 1):
        sign = 1 - 2 * reflection
        for rotation in range(6):
            for row in range(17):
                for col in range(72):
                    transformed = (sign * col + 12 * rotation) % 72
                    require(qvalues[row][col] == qvalues[row][transformed],
                            "Source LUT lacks the declared D6 code invariance")
                    require(mask[row][col] == mask[row][transformed],
                            "Source LUT lacks the declared D6 validity invariance")
                    node_checks += 1

    # Orbit representatives are sufficient only for the verified invariant
    # scalar fixture, not for arbitrary measured fields or model weights.
    remaining = set(range(72))
    orbits = []
    while remaining:
        representative = min(remaining)
        orbit = sorted({((1 - 2 * b) * representative + 12 * k) % 72
                        for b in (0, 1) for k in range(6)})
        orbits.append(orbit)
        remaining.difference_update(orbit)
    valid_orbits_per_row = [sum(mask[row][orbit[0]] for orbit in orbits)
                            for row in range(17)]
    orbit_analysis = {
        "angular_representatives": [orbit[0] for orbit in orbits],
        "angular_orbit_sizes": [len(orbit) for orbit in orbits],
        "full_grid_representatives": 17 * len(orbits),
        "valid_representatives": sum(valid_orbits_per_row),
        "valid_representatives_per_row": valid_orbits_per_row,
        "canonical_angle_index": "min(j%12,12-(j%12))",
        "scope": "This exact scalar code and validity fixture only",
        "compressed_payload_emitted": False,
    }

    level_bytes = files["log2_levels_bitmatrix.bin"]
    require(len(level_bytes) == 512, "Expected 512-byte log-level matrix")
    require(len(packet["log_level_lut"]["value_words"]) == 64, "Expected 64 levels")
    for code in range(64):
        word = level_bytes[8 * code:8 * (code + 1)]
        require(int.from_bytes(word, "big") == (1 << code) - 1,
                "Wrong exact logarithmic level")
        require(bits(word) == packet["log_level_lut"]["value_words"][code],
                "Log-level JSON and binary differ")

    raw_frames = files["coordinate_frames.bin"]
    records = packet["demonstration"]["records"]
    require(len(records) == 5 and len(raw_frames) == 140,
            "Expected five 28-byte coordinate fixtures")
    for i, record in enumerate(records):
        frame = bits(raw_frames[i * 28:(i + 1) * 28])
        require(frame[217:] == "0" * 7, "Nonzero coordinate padding")
        expected = "".join(record[field] for field, width in FIELDS)
        for field, width in FIELDS:
            uint(record[field], width)
        require(frame[:217] == expected, "Coordinate fixture mismatch")
        latitude = sint(record["latitude_phi_word"], 40)
        longitude = sint(record["longitude_lambda_word"], 40)
        theta = uint(record["theta_word"], 39)
        winding = sint(record["winding_word"], 32)
        require(-TURN // 4 <= latitude <= TURN // 4, "Latitude out of range")
        require(-TURN // 2 <= longitude < TURN // 2, "Longitude out of range")
        require(theta < TURN, "Unused theta code")
        require(sint(record["Phi_unwrapped_word"], 71) == winding * TURN + theta,
                "Unwrapped phase mismatch")
        pole = abs(latitude) == TURN // 4
        require(record["longitude_defined_bit"] == ("0" if pole else "1"),
                "Longitude defined flag mismatch")
        require(not pole or longitude == 0, "Pole longitude must be canonical zero")

    metadata = {
        "profile_id": legacy["profile_id"],
        "shape": [17, 72],
        "word_bits": 16,
        "q16_bit_order": "MSB first; plane, radial row, angular column",
        "validity_bit_order": "MSB first; radial row, angular column",
        "turn_nanodegrees": TURN,
        "d6_angle_index_action": "j_prime=((1-2*b)*j+12*k)%72",
        "q16_inverse_normalized": "16^(q/65535)-1",
        "exact_log2_level": "(1<<k)-1; k in [0,63]",
        "source_kind": legacy["source_kind"],
        "calibration": legacy["calibration"],
        "physical_uncertainty": legacy["physical_uncertainty"],
        "center": legacy["center"],
        "coordinates": legacy["coordinates"],
        "geometry": legacy["geometry"],
        "lookup": legacy["lookup"],
        "decoder": legacy["decoder"],
        "coordinate_transport_fields": [{"field": f, "bits": w} for f, w in FIELDS],
        "coordinate_frame_bits": 217,
        "coordinate_frame_padding_bits": 7,
        "coordinate_fixtures": records,
        "verified_orbit_analysis": orbit_analysis,
        "metadata_numeric_style": "Ordinary JSON integers; source rational subrecords unchanged",
    }
    checks = {
        "manifest_files_checked": len(checked_names),
        "manifest_sha256_and_sizes_passed": True,
        "canonical_numeric_bits_passed": True,
        "packed_code_mask_json_equivalence_passed": True,
        "valid_nodes": 1158,
        "invalid_nodes": 66,
        "d6_node_actions_checked": node_checks,
        "d6_code_and_mask_invariance_passed": True,
        "d6_angular_orbits": len(orbits),
        "d6_full_grid_representatives": 17 * len(orbits),
        "d6_valid_representatives": sum(valid_orbits_per_row),
        "exact_log2_levels_checked": 64,
        "coordinate_fixture_records_checked": 5,
        "coordinate_domains_padding_phase_passed": True,
        "embedded_code_executed": False,
    }
    return metadata, checks


def import_pdf(pdf: Path, output: Path) -> dict:
    raw_pdf = pdf.read_bytes()
    reader = PdfReader(io.BytesIO(raw_pdf))
    attachment_name = "log_net_D_bits_bundle.zip"
    attachments = reader.attachments.get(attachment_name)
    require(attachments is not None and len(attachments) == 1,
            "Expected exactly one named log-net-D bundle attachment")
    raw_zip = attachments[0]
    files = unpack_zip(raw_zip)
    metadata, checks = validate(files)
    provenance = {
        "source_document_title": "log net D UNIVERSAL, Edition 2, 30 October 2026",
        "source_pdf_sha256": sha256(raw_pdf),
        "embedded_attachment": attachment_name,
        "embedded_attachment_sha256": sha256(raw_zip),
        "source_page_map": {
            "integer_coordinates": [3, 4, 5, 6],
            "d6_group": [7], "q16_lut": [8], "exact_log2_levels": [9],
            "q16_inverse": [10, 15], "transport": [11],
            "bundle_interface": [12], "measurement_limits": [13],
        },
        "original_binary_payloads": {
            name: {"bytes": len(files[name]), "sha256": sha256(files[name])}
            for name in BINARY_NAMES
        },
        "validation": checks,
        "data_role": "Synthetic arithmetic fixtures, not measured phone telemetry",
        "license_status": "User-supplied source; separate redistribution terms not supplied",
        "included_personal_identifier_fields": False,
    }
    output.mkdir(parents=True, exist_ok=True)
    for name in BINARY_NAMES:
        (output / name).write_bytes(files[name])
    (output / "source_metadata.json").write_text(
        json.dumps(metadata, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    (output / "provenance.json").write_text(
        json.dumps(provenance, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    return provenance


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pdf", type=Path, help="The supplied log_net_D_master PDF")
    parser.add_argument("--out", type=Path,
                        default=Path(__file__).resolve().parents[1] / "assets" / "lognet")
    args = parser.parse_args()
    result = import_pdf(args.pdf, args.out)
    print(json.dumps({"output": str(args.out), **result["validation"]}, indent=2))


if __name__ == "__main__":
    main()
