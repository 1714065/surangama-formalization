<!-- SPDX-License-Identifier: CC0-1.0 -->

# Status: wording rules and claim table

<!-- project-principle:2026-09-29 -->
> **项目共同原则（2026-09-29）**
>
> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。
<!-- /project-principle -->

Role: `record` · Lifecycle: `active` · Lean check: see `audit/lean-axioms.txt` (date stamped).

## Wording rules

- Never write "the sutra is true", "the sutra is consistent", or "the sutra
  proves X". Write "under reading `Rk` and premise set `P`, the formal
  counterpart of passage `…` is derivable / is refuted".
- "Proved" is used only together with a theorem name.
- A countermodel is described as "premise set `P` does not refute / does not
  derive …", never as "the sutra is wrong" or "modern science refutes the sutra".
- Every premise carries its status: `dialogue-accepted` (Ānanda accepts it in
  the text), `project-restatement` (the project's formal rewording of a
  textual move), or `modern` (a premise the project introduces for
  comparison). None of these statuses means "true".
- Every source locator carries its status: `passage_aligned`, `work_level`,
  or `unverified`. `unverified` is never filled from a search snippet or from
  memory.
- When a formal reading differs across logics or premise formulations (for
  example `L4` versus `L4_of_forward`), both are stated.
- A statement about a science (physiology, psychology) is labelled
  `modern comparison`; the repository makes no empirical claim.

## Readings

| Reading | Content | Where |
| --- | --- | --- |
| `R1` | The "aware-knowing mind" (覺了能知之心) of the dialogue is the object-directed cognizing mind (識心 / 攀緣心), as the commentaries take it (圓瑛: 破妄識; 交光: 帶妄顯真) | `Core.lean`, `SutraPremises` |
| `R2` | A second object, the seeing-essence (見精), pervades and discerns; it is not the object refuted in `R1` | `Countermodels.lean`, `FieldPremises` |
| `Modern` | Perception requires a sensory channel (channel principle) | `Countermodels.lean`, `ModernPremises` |

## Claim table: the seven-location argument (fascicle 1)

Locators: `L…` = line numbers in the project's extraction of 圓瑛《大佛頂首楞嚴經講義》(not redistributed; see `docs/SOURCES.md`). CBETA column locators: `unverified` in v0.1.0.

| H | Passage (paraphrase) | Locator | Premises used | Theorem | Premise status |
| --- | --- | --- | --- | --- | --- |
| H1 | The mind is inside the body; if so it should first see the viscera; it does not | L526–L570 | A01, A02 | `L1` | A01 dialogue-accepted (堂室喻); A02 dialogue-accepted |
| H2 | The mind is outside the body; if so body and mind would not know each other; they do | L573–L607 | A03, A04 | `L2` | A03 dialogue-accepted; A04 dialogue-accepted (眾僧食喻) |
| H3 | The mind lies in the eye-faculty like glass on the eye; if so it would see the eye; it does not | L610–L637 | A05, A06 | `L3` | A05 dialogue-accepted (琉璃喻); A06 dialogue-accepted |
| H4 | Closing the eyes and seeing darkness is seeing inside; the darkness either faces the eye (then it is outside) or does not (then no seeing) | L643–L680 | A07a, A07b, A07c | `L4` (classical), `L4_of_forward` (constructive, with A07c in forward form) | A07a project-restatement; A07b, A07c dialogue-accepted |
| H5 | The mind arises wherever it combines; combining needs a body; a body is one or many; both fail | L684–L719 | A08, A09a, A09b, A09c | `L5` via `no_body` | all dialogue-accepted; only the one/many dichotomy of the fourfold argument is used |
| H6 | The mind is between faculty and object; either it partakes of both (incoherent) or of neither (no body) | L727–L769 | A10a, A10b, A10c (`L6`) / A09a–c, A10c (`L6_shortcut`) | `L6`, `L6_shortcut` | dialogue-accepted |
| H7 | Being attached to nothing is the mind; then it is either nothing (impossible) or has a form (then it is somewhere) | L775–L797 | A11a, A11b, A11c and all of L1–L6 | `L7` | A11a, A11b dialogue-accepted; A11c project-restatement |
| all | None of the seven places holds | L796–L797 | all nineteen | `seven_refutations`, `no_candidate_place` | — |

## Model results

Local teaching addition (2026-09-29): [`InsideConditional.not_inside`](INSIDE_CONDITIONAL.md)
isolates H1's two premises as explicit parameters. The lamp analogy is Ānanda's
response after the first refutation (T19 p107b06–11), not an initial verbatim
premise. Three propositional witnesses establish premise satisfiability and
show that neither premise alone excludes `Inside`. This does not change the
claim boundary of `L1` or adjudicate brain-based theories of consciousness.

| Result | Theorem | What it shows | What it does not show |
| --- | --- | --- | --- |
| Premise set satisfiable | `sutra_premises_satisfiable` | The nineteen premises have a model | that the premises are true |
| H1 not refuted under the channel principle | `H1_not_refuted_by_modern`, `brainWorld_violates_A01` | The refutation of H1 rests on A01; a channel-principle premise set has a model with the mind inside the body | that modern physiology refutes the sutra, or that the sutra refutes physiology |
| Two objects | `key_difference`, `sutra_and_field_compatible` | `R1` premises and `R2` field premises are jointly satisfiable on distinct objects; "the mind is inside" is false of one and true of the other | that either object exists, or that `R2` is the sutra's doctrine |
| Classical dependence | `L4` vs `L4_of_forward` | Excluded middle enters only through the contrapositive formulation of A07c | that the argument "requires classical logic" |

## What the build enforces

- No `sorry` (checked by `verify.sh` / `tools/check-lean.ps1`).
- Every theorem named in this file or in `README.md` exists (manual check in v0.1.0; a name guard is listed in `docs/OPEN_PROBLEMS.md`).
- `audit/lean-axioms.txt` is regenerated from `Surangama.SevenLocations.Audit` and committed with a date stamp.

## C2 local addition (2026-09-30)

[`C2.not_outside`](C2_OUTSIDE_CONDITIONAL.md) isolates the two premises of L2 as theorem parameters.
The bridge `Outside → ¬ BodyMindKnowTogether` is a `project-restatement`; the positive knowing example
is `dialogue-accepted` (T19 p107b18–19), with subsequent acceptance evidence at p107b22–24.
Three logical valuations check premise satisfiability and the insufficiency of either premise alone.
The build and axiom report pass for all four C2 theorems. Empty axiom lists do not remove the premises.

## C3 local addition (2026-09-30)

[`C3.not_in_root_two_branches`](C3_IN_ROOT_CONDITIONAL.md) combines the reconstructed branches under three explicit premises:
in-root implies seeing-eye; in-root requires following-seeing; seeing-eye prevents following-seeing.
The new `not_in_root_of_seeing` handles the seeing branch. The original `not_in_root` retains the not-seeing branch.
The combined proof does not require an additional not-seeing premise or excluded middle.
The root/object distinction is an explicit interpretive bridge, not a theorem about organs losing function when observed.
C3 contains ten theorems: three refutations and seven propositional scope witnesses, all without axiom dependencies.

## C4 local addition (2026-09-30)

[`C4.not_darkness_is_inner_sight`](C4_DARKNESS_CONDITIONAL.md) refutes the two specified readings of darkness-as-inner-sight under seven explicit parameters. Root/object roles are distinct from bodily spatial location. The main proof combines the ordinary-darkness branch and the inward-viewing location conflict; it does not require excluded middle.

Ownership, two independent knowers, and the dark-room counterexample have separate conditional proofs. `not_inward_via_knower_rescue` connects inward viewing to the external-knower and two-knowers consequences as an alternative extended route. The doctrinal terminal conditions are explicit, not definitions of Buddha.

C4 contains 17 theorems: 11 conditional derivations and six propositional scope witnesses. The latter check three premise sets and three selected premise omissions, not the independent necessity of every parameter. All 17 build and have empty axiom dependency lists, without removing their explicit assumptions. This is a local addition, not part of published v0.1.0; existing L4 keeps its scope.

## C6 local addition (2026-10-02)

[`C6.not_in_middle_four_cases`](C6_MIDDLE_CONDITIONAL.md) refutes the specified root/object-middle claim under eight substantive premises and two explicit logical case splits. It covers both affiliations, root only, object only, and neither. The single-side arguments are approved project reconstructions; causal dependence is not automatically identity or complete affiliation.

Six theorems (classification, four refutations, summary) passed the full build and have empty axiom dependency lists. The external Boolean scope audit checks 256 valuations: 33 satisfy all substantive premises, every branch has a compatible valuation, and removing each single substantive premise permits Claim. These are not empirical models. Body-center and marker-direction preliminaries are not included in the main theorem. Existing L6 and the separate historical change-of-basis model remain unchanged. This is a local addition, included in v0.2.0.

## C7 local addition (2026-10-03)

[`C7.not_unlocated_all_cases`](C7_UNLOCATED_CONDITIONAL.md) refutes the specified wholly-unlocated cognizing-mind claim under four substantive premises and one explicit body/no-body case split. The form-to-location bridge is a hypothesis, not a universal theorem about existence. The three theorems passed direct compilation, full build and axiom audit; all have empty dependency lists while retaining their parameters. The Boolean scope audit checks 32 assignments, 5 compatible, both branches represented; each single substantive omission permits Claim. Existing L7 is unchanged. No ontology or empirical mind-brain claim is established.

## C5 integration and C1–C7 review · 2026-10-03

[C5 contact conditional proof](C5_CONTACT_CONDITIONAL.md) is now included in the aggregate build and axiom audit. The current C1–C7 modules contain 49 theorem declarations (including branch lemmas and scope witnesses), all with empty axiom dependencies; explicit premises remain. This does not replace the historical Core L1–L7 models.
