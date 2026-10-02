<!-- SPDX-License-Identifier: CC0-1.0 -->

# C7: the unlocated cognizing-mind explanation

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

Local addition, 2026-10-03, included in v0.2.0. Passage-aligned: T19n0945 fascicle 1, p108b04–14. Source: [C7_Unlocated.lean](../lean/Surangama/SevenLocations/C7_Unlocated.lean).

## Approved reading and scope

The user identifies Ananda's claim as a cognizing mind-body with no location whatsoever. Here nonattachment means no location, not freedom from craving. The two hypothetical cases concern the candidate mind-body, not the objects to which it is said not to attach. The latter is a different commentary reading, not combined here.

Five propositions: Claim, HasBody (the candidate mind-body has a referent, not a physical body), HasForm (its form in this model), Knower (the candidate can fulfill the asserted cognizing role), Located (it has some location). Unknown location is not absence of every location.

## Explicit parameters

All four substantive parameters are `project-restatement`, adopted by the user; that status is not a claim of a separate recorded concession by Ananda.

| Parameter | Meaning |
| --- | --- |
| `claim_content` | Claim requires Knower and not Located |
| `no_body_no_knower` | A wholly absent candidate cannot fulfill the asserted cognizing role |
| `body_has_form` | In this model, HasBody implies HasForm |
| `form_has_location` | In this model, HasForm implies Located; crucial interpretive bridge |

The logical parameter `body_cases` explicitly supplies HasBody or not HasBody. No global ontology is introduced. The absent branch does not prohibit ordinary negative sentences about fictional objects. The present branch does not establish a universal law that existence entails spatial location.

## Inventory and verification

Three theorems: `not_unlocated_without_body`, `not_unlocated_with_body`, `not_unlocated_all_cases`. Direct compilation, full `tools/check-lean.ps1`, and `tools/print-axioms.ps1` passed with toolchain `leanprover/lean4:v4.35.0-rc2`. All three axiom lists are empty; explicit premises remain. No imports or proof placeholders. See [audit](../audit/lean-axioms.txt).

Personal-project Boolean scope audit `lean/C7_scope_check_20261003.py`: 32 assignments, 5 satisfy all four substantive conditions, all refute Claim, and each body case has a compatible assignment. Deleting any single substantive condition admits Claim. This is a logical scope check, not an empirical mind model.

## Source mapping and limits

Yuan Ying P00778 and P00785–P00792; Hsuan Hua X01777–X01786; Cheng Guan PDF physical pages 88–90. The ancient quotation, Ananda's interpretation, and commentary analysis are kept distinct. The argument does not assume that Ananda lied, nor infer endorsement of his conclusion merely from the absence of an explicit denial of his recollection. It does not define Buddha/Tathagatagarbha.

C5 does not independently establish HasBody and is not imported. Existing Core.L7 remains unchanged. Full traditional scripture, source comparison, and foldable checked source appear in the personal-project `研究札记_执心乃无著_逻辑与论据_20261003.md/html`.

The public release includes [the portable scope checker](../tools/check_scope.py), [its output](../audit/propositional-scope.json), and [the research guide](RESEARCH_GUIDE_zh.md); no personal-project paths are needed to reproduce the checks.
