<!-- SPDX-License-Identifier: CC0-1.0 -->

# Formalization catalogue (v0.2.0, hand-written)

<!-- project-principle:2026-09-29 -->
> **项目共同原则（2026-09-29）**
>
> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。
<!-- /project-principle -->

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

### `Surangama.SevenLocations.InsideConditional`

Local teaching addition (2026-09-29); not part of the published v0.1.0 release.

- **Target:** a two-premise teaching version of H1, without the full `SutraPremises` bundle.
- **Formal scope:** `not_inside`; three propositional witnesses for satisfiability and the insufficiency of either premise alone.
- **Premise policy:** explicit theorem parameters; the bridge from location to inner knowing is a `project-restatement` supported by dialogue evidence, not a proved universal law.
- **Checked inventory:** 4 theorems; no explicit imports.
- **Historical status:** `passage_aligned`, T19n0945 p107a19–b11, b24–29; the later objection at p108a04 is recorded in [the explanation](../docs/INSIDE_CONDITIONAL.md).
- **Limit:** conditional derivation only. No temporal model of “先”, ontology of Buddha/Tathāgatagarbha, or refutation of brain-based consciousness.

### `Surangama.SevenLocations.C2`

Local addition (2026-09-30); not part of the published v0.1.0 release.

- **Target:** C2, the outside-location refutation; a two-premise version of L2.
- **Formal scope:** `not_outside`; three propositional witnesses for satisfiability and insufficiency of either premise alone.
- **Premise policy:** explicit theorem parameters; Outside implies no body/mind knowing, and the dialogue's concrete eye-seeing/mind-discriminating example supplies such knowing.
- **Checked inventory:** 4 theorems; no explicit imports; no axiom dependencies.
- **Historical status:** `passage_aligned`, T19n0945 p107b06–24; [premise mapping and limits](../docs/C2_OUTSIDE_CONDITIONAL.md).
- **Limit:** does not establish that spatial separation entails absence of cognitive relation, nor define Buddha/Tathāgatagarbha. Brain-based consciousness is outside this claim.

### `Surangama.SevenLocations.C3`

Local addition (2026-09-30); not part of the published v0.1.0 release.

- **Target:** the in-root glass-analogy refutation, reconstructed seeing and not-seeing branches.
- **Formal scope:** `not_in_root`, `not_in_root_of_seeing`, `not_in_root_two_branches`; seven propositional witnesses for premise satisfiability and insufficiency of each remaining premise set after one condition is removed.
- **Premise policy:** the combined proof takes `InRoot → SeesEye`, `InRoot → FollowsSeeing`, and `SeesEye → ¬ FollowsSeeing` explicitly; no extra not-seeing premise or excluded middle is used.
- **Checked inventory:** 10 theorems; no explicit imports; no axiom dependencies.
- **Historical status:** `passage_aligned`, T19n0945 p107b22–c08; [premise mapping and limits](../docs/C3_IN_ROOT_CONDITIONAL.md).
- **Limit:** root/object incompatibility remains an interpretive premise; this is not a formalization of all cognitive semantics or a universal refutation of eye-related cognition theories.

### `Surangama.SevenLocations.C4`

Local addition (2026-09-30); not part of the published v0.1.0 release.

- **Target:** darkness-as-inner-sight, with the inward-viewing, ownership and two-knowers follow-up questions.
- **Formal scope:** a seven-parameter main theorem `not_darkness_is_inner_sight`; separate branches and subsequent refutations, an alternative extended `not_inward_via_knower_rescue`, and a supplementary dark-room lemma. Six propositional witnesses check three premise sets and three selected omissions.
- **Premise policy:** explicit theorem parameters; role-to-evidence and direct-viewing bridges remain interpretive conditions. Two-knowers-to-two-Buddhas and the rejection of that consequence remain explicit doctrinal conditions.
- **Checked inventory:** 17 theorems (11 conditional derivations, six scope witnesses); no explicit imports; no axiom dependencies.
- **Historical status:** `passage_aligned`, T19n0945 p107c09–23; [premise mapping and limits](../docs/C4_DARKNESS_CONDITIONAL.md).
- **Limit:** the main theorem covers the two stated explanations, not all possible cognition theories. The later and supplementary branches are not dependencies of the main theorem. No ontology of Buddha/Tathāgatagarbha, universal optical law, or empirical mind-brain claim is established.

### `Surangama.SevenLocations.C5ContactConditional` (file `C5.lean`)

- **Target:** the contact-location claim under the selected no-body/body and arrival model.
- **Formal scope:** five theorems; `not_at_contact_all_cases` combines the two branches.
- **Premise policy:** seven substantive premises and one explicit logical split; all bridges are conditional project restatements.
- **Historical status:** `passage_aligned`, T19n0945 p107c23–108a14; [mapping](../docs/C5_CONTACT_CONDITIONAL.md).
- **Limit:** does not cover all one/many and pervasive/nonpervasive arguments, or refute cognition arising under conditions. Absence of a candidate is not absence of independent nature.

### `Surangama.SevenLocations.C6`

Local addition (2026-10-02); not part of the published v0.1.0 release.

- **Target:** the claimed mind-body located between root and object, four affiliation cases.
- **Formal scope:** `four_cases`, four branch refutations, `not_in_middle_four_cases`.
- **Premise policy:** eight substantive conditions and two explicit excluded-middle instances supplied as parameters. Single-side exclusions are project reconstructions, not separately quoted scripture arguments.
- **Checked inventory:** six theorems; no imports; empty axiom dependencies. Full build passed.
- **Historical status:** `passage_aligned`, T19n0945 p108a15–b03; [premise mapping and limits](../docs/C6_MIDDLE_CONDITIONAL.md).
- **Limit:** excludes the specified affiliation model, not every conditioned cognition theory; body-center and marker preliminaries are not formalized here. Existing L6 is preserved.

### `Surangama.SevenLocations.C7`

Local addition (2026-10-03); not part of published v0.1.0.

- **Target:** the specified cognizing mind-body with no location whatsoever; nonattachment is read as no location here.
- **Formal scope:** `not_unlocated_without_body`, `not_unlocated_with_body`, `not_unlocated_all_cases`.
- **Premise policy:** four explicit substantive conditions plus a body/no-body logical case split. Form implies location only as a hypothesis of this reading.
- **Checked inventory:** three theorems; no imports; empty axiom dependency lists; full build passed.
- **Historical status:** `passage_aligned`, T19n0945 p108b04–14; [premises and limits](../docs/C7_UNLOCATED_CONDITIONAL.md).
- **Limit:** no ontological existence verdict; no universal spatial-location law; not a refutation of non-craving. Existing L7 is preserved.

## C5 integration and C1–C7 review · 2026-10-03

[C5 contact conditional proof](../docs/C5_CONTACT_CONDITIONAL.md) is now included in the aggregate build and axiom audit. The current C1–C7 modules contain 49 theorem declarations (including branch lemmas and scope witnesses), all with empty axiom dependencies; explicit premises remain. This does not replace the historical Core L1–L7 models.
