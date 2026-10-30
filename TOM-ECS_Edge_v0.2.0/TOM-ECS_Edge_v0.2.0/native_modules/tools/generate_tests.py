#!/usr/bin/env python3
"""Render C expectations from executed original-WASM golden receipts."""
import json,pathlib
base=pathlib.Path(__file__).resolve().parents[1]
g=json.loads((base/'tests/golden.json').read_text())
q=json.dumps
out=['/* Generated expectations from original WASM in Node; do not hand edit. */',
 'typedef struct golden_event{const char*memory;const char*projection;const char*output;unsigned count;int64_t statuses[16];}golden_event;',
 'typedef struct golden_profile{const char*id;const char*bootstrap;golden_event events[4];}golden_profile;',
 'static const golden_profile goldens[8]={']
for p in g['profiles']:
 out.append('{'+q(p['id'])+','+q(p['bootstrap_sha256'])+',{')
 for e in p['events']:
  calls=[c for c in e['calls'] if c['op']=='call'];status=','.join(c['status'] for c in calls)
  out.append('{'+','.join([q(e['full_memory_sha256']),q(e['projection_hex']),q(e['output_hex']),str(len(calls))]) + ',{'+status+'}},')
 out.append('}},')
out.append('};')
(base/'tests/golden.inc').write_text('\n'.join(out)+'\n')
