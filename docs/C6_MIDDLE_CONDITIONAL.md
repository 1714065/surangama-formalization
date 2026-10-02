<!-- SPDX-License-Identifier: CC0-1.0 -->

# C6: conditional refutation of the root/object middle

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

Local addition, 2026-10-02; included in v0.2.0. Passage-aligned: T19n0945 fascicle 1, p108a15–b03. Source: [C6.lean](../lean/Surangama/SevenLocations/C6.lean).

The user approved four cases under the same affiliation relation: both root and object, root only, object only, neither. The two single-side cases are project additions for exhaustive classification, not separate quoted arguments from the scripture. The relation is interpreted as affiliation of the claimed mind-body, not mere causal dependence.

## Explicit premises

All eight substantive parameters have status `project-restatement`; user approval is not claimed to be a recorded concession by Ananda in the scripture.

| Parameter | Working interpretation / support |
| --- | --- |
| `claim_content` | Claim requires the asserted middle and its corresponding nature |
| `both_opposed` | Both affiliations retain the opposed knowing/nonknowing sides; Yuan Ying P00762, first reading |
| `opposed_not_middle` | Such opposition does not constitute this model's middle |
| `root_only_at_side` | Root-only affiliation places the whole claimed body on the root side; approved project bridge |
| `root_side_not_middle` | That side is distinct from the asserted middle |
| `dust_only_at_side` | Object-only affiliation places the whole claimed body on the object side; approved project bridge |
| `dust_side_not_middle` | That side is distinct from the asserted middle |
| `neither_no_nature` | Neither affiliation leaves no corresponding nature within this model; Yuan Ying P00763 |

Two further parameters explicitly supply `Root ∨ ¬ Root` and `Dust ∨ ¬ Dust`. The proofs do not invoke hidden classical reasoning. Empty axiom reports do not remove these ten hypotheses.

## Inventory and verification

Six theorems: `four_cases`, four branch refutations, `not_in_middle_four_cases`. No imports, no project axioms, no proof placeholders. Direct module checking, full `tools/check-lean.ps1`, and `tools/print-axioms.ps1` passed on 2026-10-02, toolchain `leanprover/lean4:v4.35.0-rc2`. All six axiom reports are empty; see [audit](../audit/lean-axioms.txt).

The personal-project scope audit (`lean/C6_scope_check_20261002.py`) enumerates 256 valuations of eight propositions: 33 satisfy all substantive premises, all refute Claim, and all four affiliation cases have compatible valuations. Omitting each single substantive premise permits Claim. This checks propositional scope, not empirical minds.

## Limits

The body-center and marker-direction preliminary arguments are not dependencies of the main theorem. Existing Core.L6 remains unchanged. Different component properties do not automatically entail contradiction; the opposition-to-middle exclusion is an explicit interpretive premise. Causal dependence does not imply identity or spatial location. No ontology of Buddha/Tathagatagarbha and no general empirical consciousness claim is established.

Commentary locators: Yuan Ying P00722–P00769; Hsuan Hua X01719–X01762; Cheng Guan PDF physical pages 83–88 (the user's local sources). The main route follows Yuan Ying's provisional reading of Ananda's root-as-knowing distinction, not his second alternative reading. Full traditional scripture and source comparison are in the personal project's `研究札记_心在中间_逻辑与论据_20261002.md/html`.

The public release includes [the portable scope checker](../tools/check_scope.py), [its output](../audit/propositional-scope.json), and [the research guide](RESEARCH_GUIDE_zh.md); no personal-project paths are needed to reproduce the checks.
