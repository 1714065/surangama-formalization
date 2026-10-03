# SPDX-License-Identifier: Apache-2.0
"""Boolean scope audit of the stated schema, not validation of its interpretation."""
from itertools import product
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]


def main():
    rows = list(product([False, True], repeat=3))
    # d: Description; s: Separated; i: Identifies.
    common = lambda d, s, i: not s or not i
    bridge = lambda d, s, i: not d or s
    target = lambda d, s, i: d and i
    compatible = [r for r in rows if common(*r) and bridge(*r)]
    assert len(compatible) == 4
    assert all(not target(*r) for r in compatible)
    assert any(r[0] for r in compatible)
    missing_common = next(r for r in rows if bridge(*r) and target(*r))
    missing_bridge = next(r for r in rows if common(*r) and target(*r))
    assert not common(*missing_common)
    assert not bridge(*missing_bridge)
    witnesses = {}
    for j in range(7):
        assignment = [(k == j, False, k == j) for k in range(7)]
        assert all(common(*r) for r in assignment)
        assert all(bridge(*r) for k, r in enumerate(assignment) if k != j)
        assert target(*assignment[j])
        witnesses[f'C{j+1}'] = assignment
    source = (ROOT/'lean/Surangama/SevenLocations/SharedNonduality.lean').read_text(encoding='utf-8')
    result = {
        'scope': 'Boolean valuations of transcribed formulas, not textual or empirical verification.',
        'variables': ['Description', 'Separated', 'Identifies'],
        'valuations_checked_per_schema': 8,
        'compatible_valuations': compatible,
        'all_compatible_refute_conjunction': True,
        'description_can_remain_true': True,
        'without_common_exclusion': missing_common,
        'without_bridge': missing_bridge,
        'seven_single_bridge_omission_witnesses': witnesses,
        'source_sha256_lf': hashlib.sha256(source.encode()).hexdigest(),
    }
    (ROOT/'audit/shared-nonduality-scope.json').write_text(
        json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print('SharedNonduality: 8 valuations, 4 models; both conditions needed; all 7 bridge-omission witnesses passed.')


if __name__ == '__main__':
    main()
