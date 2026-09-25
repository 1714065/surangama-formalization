<!-- SPDX-License-Identifier: CC0-1.0 -->

# Status: wording rules and claim table

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
