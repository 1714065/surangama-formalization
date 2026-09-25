<!-- SPDX-License-Identifier: CC0-1.0 -->

# Formalization catalogue (v0.1.0, hand-written)

Every Lean module gets a public boundary: target, formal scope, premise policy, source status, and limit. Mechanical facts (declaration counts) are from the source files; interpretive judgments are the maintainer's.

### `Surangama.SevenLocations.Core`

- **Target:** the seven-location argument (七處徵心 / 七番破處), fascicle 1.
- **Formal scope:** a `World` of objects and predicates; `SutraPremises` with nineteen fields; seven refutation theorems `L1`–`L7` (plus `L4_of_forward`, `L6_shortcut`, `no_body`); main theorem `seven_refutations`; `no_candidate_place`.
- **Premise policy:** all premises are structure fields; no global axiom. Statuses per premise in `docs/STATUS.md`.
- **Checked inventory:** 2 types/structures, 11 theorems, 0 examples; imports none.
- **Historical status:** `work_level` for Taishō T19n0945 (fascicle identified, columns unverified); `passage_aligned` for the project's working extraction of 圓瑛 (line numbers L526–L797).
- **Limit:** a bounded modern reconstruction under reading `R1`; not an edition, translation, exhaustive doctrine, or uniquely correct reading.

### `Surangama.SevenLocations.Countermodels`

- **Target:** finite models answering three questions the theorems cannot.
- **Formal scope:** `emptyWorld` (premise satisfiability); `ChannelWorld`, `ModernPremises`, `brainWorld` (H1 not refuted under the channel principle); `TwoObjectWorld`, `FieldPremises`, `twoMinds` (two objects named "mind").
- **Premise policy:** modern and field premises are structures, labelled `modern` and `R2`.
- **Checked inventory:** 4 types/structures, 3 definitions, 9 theorems; imports `Core`.
- **Historical status:** `not_applicable` for `ModernPremises` (modern comparison); `work_level` for `FieldPremises` (reading `R2`, 見精; no passage mapped in v0.1.0).
- **Limit:** consistency and non-derivability results only; no empirical claim.

### `Surangama.SevenLocations.Audit`

- **Target:** `#print axioms` for every theorem.
- **Historical status:** `not_applicable`.
- **Limit:** import and report convenience only.
