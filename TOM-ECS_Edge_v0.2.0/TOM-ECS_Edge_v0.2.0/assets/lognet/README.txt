LOG NET D NUMERIC SOURCE PAYLOAD

These four binary files are copied byte-for-byte from the embedded
log_net_D_bits_bundle.zip in the supplied 50-page master PDF, Edition 2.
provenance.json records the PDF, attachment and binary SHA-256 hashes and
the independently repeated validation results. The standalone importer
validates the supplied machine packet without executing embedded code.

Reimport from the original source:
  python3 -m pip install pypdf
  python3 tools/import_lognet.py /path/to/log_net_D_master.pdf

Binary layout (see PDF pages 8-12):
  hex_q16_bitplanes.bin       2,448 bytes: 16 x 17 x 72 bits.
      MSB first, bitplane then radial row then angular column.
  hex_validity_bits.bin         153 bytes: 17 x 72 bits.
      MSB first, radial row then angular column; 1,158 valid, 66 invalid.
  log2_levels_bitmatrix.bin     512 bytes: 64 x 64 bits.
      Row k holds the unsigned 64-bit integer (1 << k) - 1, big endian.
  coordinate_frames.bin        140 bytes: five 28-byte demonstration records.
      Fields: signed latitude 40, signed longitude 40, signed height 64,
      unsigned theta 39, signed winding 32, valid 1, longitude-defined 1.
      Every record has seven trailing zero padding bits; MSB first.

Declared mathematical meanings:
  PDF p4: integer angles count nanodegrees; 360000000000 ticks per turn.
  PDF p6: Phi = winding * ticks_per_turn + theta, so Phi requires 71 bits.
  PDF p7: D6 has six rotations and six reflections. For the 72-node table,
          j' = ((1 - 2*b) * j + 12*k) mod 72, k in [0,5], b in {0,1}.
  PDF p8: q16 and validity are separate; invalid zero is not a valid zero.
  PDF p9: the exact_log2_levels_64 table and Q16 encoding are separate.
  PDF p10: normalized Q16 inverse is 16^(q/65535) - 1.
  PDF p13: numerical precision does not establish physical sensor accuracy.

source_metadata.json preserves the separate center record, source radii,
geometry, masks, decoder, and lookup rules. The default query is an exact
node query. There is no interpolation across the unrepresented inner
radial interval or a silently recomputed ideal mask.

These are synthetic source fixtures. Calibration and physical uncertainty
are null. They are not live phone measurements, learned AI parameters,
or evidence of unbounded context capacity. No personal ID or birth date is
needed in numeric payloads, model prompts, telemetry identifiers, or logs.

The Google-search export is an inspiration/source-text document. Its
claims about Codex internals, inverse-log attention, military RF support,
and lossless finite storage of unlimited data are not implemented facts.
The source packet does not define a dynamic law named D(t), an AI learning
rule, or a general edge-polymorphic compiler; those are runtime extensions
documented separately in this project.
