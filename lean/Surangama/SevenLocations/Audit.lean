/- SPDX-License-Identifier: Apache-2.0 -/

import Surangama.SevenLocations.Core
import Surangama.SevenLocations.Countermodels
import Surangama.SevenLocations.C1_Inside
import Surangama.SevenLocations.C2_Outside
import Surangama.SevenLocations.C3_InRoot
import Surangama.SevenLocations.C4_LightAndDarkness
import Surangama.SevenLocations.C5_AtContact
import Surangama.SevenLocations.C6_Middle
import Surangama.SevenLocations.C7_Unlocated
import Surangama.SevenLocations.SharedNonduality

/-!
# Axiom-dependency report

`#print axioms` for every theorem in the module.  The output of checking this
file is recorded in `audit/lean-axioms.txt` by `tools/print-axioms.ps1` /
`tools/print-axioms.sh`.  Because premises are structure fields or explicit
theorem parameters, no
project-defined axiom can appear here; the only possible entries are Lean's
three standard axioms (`propext`, `Classical.choice`, `Quot.sound`), and they
appear exactly where a proof uses excluded middle.
-/

namespace Surangama.SevenLocations

#print axioms L1
#print axioms L2
#print axioms L3
#print axioms L4
#print axioms L4_of_forward
#print axioms L5
#print axioms L6
#print axioms L6_shortcut
#print axioms L7
#print axioms seven_refutations
#print axioms no_candidate_place
#print axioms sutra_premises_satisfiable
#print axioms H1_not_refuted_by_modern
#print axioms brainWorld_violates_A01
#print axioms key_difference
#print axioms sutra_and_field_compatible

#print axioms InsideConditional.not_inside
#print axioms InsideConditional.premises_have_model
#print axioms InsideConditional.without_bridge_allows_inside
#print axioms InsideConditional.without_no_inner_knowing_allows_inside

#print axioms C2.not_outside
#print axioms C2.premises_have_model
#print axioms C2.without_bridge_allows_outside
#print axioms C2.without_knowing_allows_outside

#print axioms C3.not_in_root
#print axioms C3.premises_have_model
#print axioms C3.without_bridge_allows_in_root
#print axioms C3.without_no_seeing_eye_allows_in_root

#print axioms C3.not_in_root_of_seeing
#print axioms C3.not_in_root_two_branches
#print axioms C3.two_branch_premises_have_model
#print axioms C3.two_branch_without_bridge_allows_in_root
#print axioms C3.two_branch_without_following_allows_in_root
#print axioms C3.two_branch_without_incompatibility_allows_in_root

#print axioms C4.not_seeing_without_facing
#print axioms C4.not_ordinary_darkness_explanation
#print axioms C4.not_inward_when_no_face
#print axioms C4.not_inward_when_face
#print axioms C4.not_inward_explanation
#print axioms C4.not_darkness_is_inner_sight
#print axioms C4.not_external_ownership_by_face
#print axioms C4.not_two_knowers
#print axioms C4.not_external_knower_rescue
#print axioms C4.not_inward_via_knower_rescue
#print axioms C4.not_darkness_criterion
#print axioms C4.ordinary_premises_have_model
#print axioms C4.ordinary_without_evidence_bridge_allows_claim
#print axioms C4.inward_premises_have_model
#print axioms C4.inward_without_face_bridge_allows_claim
#print axioms C4.knower_premises_have_model
#print axioms C4.knower_without_terminal_limit_allows_rescue

#print axioms C5ContactConditional.not_at_contact
#print axioms C5ContactConditional.no_body_no_contact_from_empty_example
#print axioms C5ContactConditional.not_at_contact_without_body
#print axioms C5ContactConditional.not_at_contact_with_body
#print axioms C5ContactConditional.not_at_contact_all_cases

#print axioms C6.four_cases
#print axioms C6.not_middle_of_both
#print axioms C6.not_middle_of_root_only
#print axioms C6.not_middle_of_dust_only
#print axioms C6.not_middle_of_neither
#print axioms C6.not_in_middle_four_cases

#print axioms C7.not_unlocated_without_body
#print axioms C7.not_unlocated_with_body
#print axioms C7.not_unlocated_all_cases

#print axioms SharedNonduality.bridge_for_each
#print axioms SharedNonduality.exclude_identification
#print axioms SharedNonduality.seven_identifications_refuted
#print axioms SharedNonduality.refute_contextual_claim
#print axioms SharedNonduality.premises_have_model_with_descriptions
#print axioms SharedNonduality.without_common_exclusion
#print axioms SharedNonduality.without_one_bridge
#print axioms SharedNonduality.description_can_remain

end Surangama.SevenLocations
