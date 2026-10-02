# SPDX-License-Identifier: Apache-2.0
"""Exhaustive Boolean checks of the explicitly transcribed C1-C7 premises.

Lean checks the actual proofs. This independent audit checks consistency and
single-premise omission witnesses for the stated propositional formulas; it
does not certify textual interpretation or empirical truth. No dependencies.
"""
from itertools import product
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]


def imp(a, b):
    return not a or b


def c1(c, k):
    return [imp(c, k), not k]


def c2(c, k):
    return [imp(c, not k), k]


def c3(c, s, f):
    return [imp(c, s), imp(c, f), imp(s, not f)]


def c4(c, o, i, s, f, e, face, outside):
    return [imp(c, o or i), imp(o, s and e), imp(s, f), imp(f, not e),
            imp(i, face), imp(face, outside), imp(i, not outside)]


def c4_extended(i, face, outside, rescue, body, two, buddhas):
    return [imp(i, face), imp(face, outside), imp(i and outside, rescue),
            imp(rescue, not body or two), body, imp(two, buddhas), not buddhas]


def c5(c, b, contact, inside, outside, sees, face):
    return [imp(c, contact), imp(not b, not contact), imp(c and b, inside or outside),
            imp(inside, sees), imp(outside, face), not sees, not face]


def c6(c, r, d, m, n, o, rs, ds):
    return [imp(c, m and n), imp(r and d, o), imp(o, not m),
            imp(r and not d, rs), imp(rs, not m), imp(not r and d, ds),
            imp(ds, not m), imp(not r and not d, not n)]


def c7(c, b, f, k, location):
    return [imp(c, k and not location), imp(not b, not k), imp(b, f), imp(f, location)]


SPECS = [
    ('C1', 'InsideConditional', 'Inside KnowsInside',
     'inside_requires_inner_knowing no_inner_knowing', c1, []),
    ('C2', 'C2', 'Outside BodyMindKnowTogether',
     'outside_prevents_knowing body_mind_know_together', c2, []),
    ('C3', 'C3', 'InRoot SeesEye FollowsSeeing',
     'in_root_requires_seeing_eye in_root_requires_following seeing_eye_prevents_following', c3, []),
    ('C4', 'C4', 'Claim Ordinary Inward SeesDark FacesEye InnerEvidence SeesFace Outside',
     'claim_routes ordinary_content seeing_requires_facing facing_excludes_inner_evidence inward_requires_face face_requires_outside inward_requires_inside', c4, []),
    ('C4_extended', 'C4', 'Inward SeesFace Outside ExternalRescue BodyAware TwoKnowers TwoBuddhas',
     'inward_requires_face face_requires_outside inward_outside_requires_rescue external_consequences body_aware two_knowers_entail_two_buddhas not_two_buddhas', c4_extended, []),
    ('C5', 'C5', 'Claim HasBody CanContact FromInside FromOutside SeesInside SeesFace',
     'claim_requires_contact no_body_no_contact embodied_contact_requires_arrival inside_requires_sight outside_requires_face no_inside_sight no_direct_face', c5, ['HasBody']),
    ('C6', 'C6', 'Claim Root Dust Middle HasNature Opposed RootSide DustSide',
     'claim_content both_opposed opposed_not_middle root_only_at_side root_side_not_middle dust_only_at_side dust_side_not_middle neither_no_nature', c6, ['Root', 'Dust']),
    ('C7', 'C7', 'Claim HasBody HasForm Knower Located',
     'claim_content no_body_no_knower body_has_form form_has_location', c7, ['HasBody']),
]


def main():
    reports = {}
    for key, module, names, premise_names, formula, case_names in SPECS:
        names, premise_names = names.split(), premise_names.split()
        values = list(product([False, True], repeat=len(names)))
        models = [v for v in values if all(formula(*v))]
        assert models and all(not v[0] for v in models), key
        assert len(formula(*values[0])) == len(premise_names)
        omissions = {}
        for j, premise in enumerate(premise_names):
            witness = next((v for v in values if v[0] and
                            all(p for k, p in enumerate(formula(*v)) if k != j)), None)
            assert witness is not None, (key, premise)
            omissions[premise] = dict(zip(names, witness))
        cases = []
        for case in product([False, True], repeat=len(case_names)):
            matches = [v for v in models if all(v[names.index(n)] == b for n, b in zip(case_names, case))]
            assert matches, (key, case)
            cases.append({'case': dict(zip(case_names, case)), 'count': len(matches),
                          'witness': dict(zip(names, matches[0]))})
        src = ROOT/f'lean/Surangama/SevenLocations/{module}.lean'
        # Hash normalized text, so the record is identical on Windows and Linux.
        reports[key] = {'source_sha256_lf': hashlib.sha256(src.read_text(encoding='utf-8').encode()).hexdigest(),
                        'valuations_checked': len(values), 'compatible_valuations': len(models),
                        'all_models_refute_target': True, 'cases': cases,
                        'single_premise_omission_witnesses': omissions}
        print(f'{key}: {len(values)} valuations, {len(models)} compatible; all omissions admit target.')
    result = {'scope': 'Boolean models of transcribed premises, not empirical or ontological models.',
              'logical_cases': 'Boolean semantics satisfies excluded middle; C5-C7 supply case splits explicitly to Lean.',
              'checks': reports}
    (ROOT/'audit/propositional-scope.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')


if __name__ == '__main__':
    main()
