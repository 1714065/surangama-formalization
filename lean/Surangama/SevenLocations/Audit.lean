/- SPDX-License-Identifier: Apache-2.0 -/

import Surangama.SevenLocations.Core
import Surangama.SevenLocations.Countermodels

/-!
# Axiom-dependency report

`#print axioms` for every theorem in the module.  The output of checking this
file is recorded in `audit/lean-axioms.txt` by `tools/print-axioms.ps1` /
`tools/print-axioms.sh`.  Because premises are structure fields, no
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

end Surangama.SevenLocations
