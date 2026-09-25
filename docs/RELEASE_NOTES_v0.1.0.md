<!-- SPDX-License-Identifier: CC0-1.0 -->

# v0.1.0 — the seven-location argument

First release. One argument unit of the Śūraṅgama Sūtra (大佛頂首楞嚴經,
Taishō T19 no. 945, fascicle 1), formalized in Lean 4 (`v4.35.0-rc2`, no
Mathlib). CI: build, no-`sorry` gate, axiom audit restricted to Lean's three
standard axioms, and a committed axiom-dependency record.

## Kernel-checked theorem statements and countermodels

- `SutraPremises`: the nineteen premises the dialogue relies on, as structure fields.
- `L1`–`L7`, `seven_refutations`, `no_candidate_place`: under `SutraPremises`, each of the seven candidate locations of the "aware-knowing mind" is refuted.
- `L4_of_forward`: H4 without excluded middle, given the forward form of premise A07c; `L4` (the text's dilemma) reports `Classical.choice`.
- `L6_shortcut`: H6 from a different premise subset than the text's own dilemma (`L6`).
- `sutra_premises_satisfiable` (`emptyWorld`): the nineteen premises are jointly satisfiable.
- `H1_not_refuted_by_modern`, `brainWorld_violates_A01` (`brainWorld`): under a channel-principle theory of perception, a model exists with the mind inside the body; the refutation of H1 rests on the presence-principle premise A01.
- `key_difference`, `sutra_and_field_compatible` (`twoMinds`): the sutra premises and a "field" theory of an all-pervading discerning awareness are jointly satisfiable on two distinct objects; "the mind is inside the body" is false of one and true of the other.
- No project-defined axiom appears in `audit/lean-axioms.txt`.

## Readings and premise statuses

- Reading `R1` (the refuted mind is the object-directed cognizing mind, 識心 / 攀緣心) follows 圓瑛's outline of the passage as 三番破識, first 破妄識無處.
- Reading `R2` (a second object, the seeing-essence 見精) is used only in the two-object model.
- Premise statuses: `dialogue-accepted`, `project-restatement` (A07a, A11c), `modern` (channel principle). None of these means "true".

## Locators and their status

- Taishō T19n0945, fascicle 1: `work_level` (fascicle identified; column locators `unverified` in this release; nothing filled from search snippets).
- Project extraction of 圓瑛《大佛頂首楞嚴經講義》 (line numbers `L526`–`L797`): `passage_aligned` to the extraction, which is not redistributed and is not an edition reference.
- 成觀 and 宣化 commentaries consulted for readings; not redistributed.

## What is not claimed

- That the sutra, or any premise, is true; that any doctrine is consistent; that reading `R1` or `R2` is the only reading.
- That modern physiology refutes the sutra or that the sutra refutes physiology: `brainWorld` is a non-derivability result, not an empirical claim.
- That the argument "requires classical logic": the classical dependence enters only through the formulation of A07c.
- Any result about well-being, meditation, or the brain.

## Provenance

Developed with AI assistance (Claude, Anthropic) under human direction. Proofs are accepted by the Lean kernel; source selection, readings, and claim boundaries are the author's responsibility. Method and conventions follow Benzmüller and Fuenmayor's computational hermeneutics and Ariake's *Buddhist and Comparative Asian Logic Formalizations* (Zenodo 10.5281/zenodo.22851717), which does not cover the Śūraṅgama Sūtra.

Author: Jason Wu · ORCID 0009-0003-1682-6165 · 1714065@qq.com
