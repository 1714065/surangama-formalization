<!-- SPDX-License-Identifier: CC0-1.0 -->

# Śūraṅgama Sūtra Argument Formalizations (Lean 4)

Machine-checked formalizations of arguments in the Śūraṅgama Sūtra
(大佛頂首楞嚴經, Taishō T19 no. 945) in Lean 4: premise inventories, finite
countermodels, and axiom-dependency reports.

Lifecycle: `active` · Version: `0.1.0` (unreleased) · Lean: `v4.35.0-rc2`, no Mathlib.

> **Note on authorship.** This repository was developed with AI assistance
> (Claude, Anthropic) under human direction. Every proof is accepted by the
> Lean kernel; the choice of sources, the readings, and the claim boundaries
> are the author's responsibility, not the model's. See "How this was made".

## What every claim can be traced to

Each formal claim in this repository is traceable to five things:

1. its **definitions** (`lean/Surangama/…`);
2. the **premises actually used**, as fields of a `…Premises` structure, never as global axioms;
3. a **theorem or a finite countermodel**;
4. a **source locator** (`docs/SOURCES.md`, `sources/registry.json`);
5. a **rerun command** (`tools/`, `verify.sh`).

Four questions are kept apart, and only the first is answered by the machine:
Did Lean accept the statement? Which passage motivated it? Does the formal
predicate faithfully render that passage? Are the premises true?

## What this is, and is not

This is a **bounded modern reconstruction** of selected arguments under an
explicitly named reading. It is **not** a proof that the sutra is true, that
its premises are true, that a doctrine is consistent, or that the chosen
reading is the only one. The wording rules in [`docs/STATUS.md`](docs/STATUS.md)
govern what may be claimed. The adopted text locators are not a critical
edition.

## Contents (v0.1.0)

| Module | Argument | Reading | Status |
| --- | --- | --- | --- |
| `Surangama.SevenLocations.Core` | 七處徵心 / 七番破處: seven candidate locations of the "aware-knowing mind", each refuted | `R1`: the mind under discussion is the object-directed cognizing mind (識心 / 攀緣心) | 19 premises as structure fields; 7 refutation theorems; main theorem `seven_refutations` |
| `Surangama.SevenLocations.Countermodels` | Three finite models | — | premise set satisfiable; H1 not refuted under a channel-principle theory of perception; two objects named "mind" coexist |
| `Surangama.SevenLocations.Audit` | `#print axioms` for every theorem | — | recorded in `audit/lean-axioms.txt` |

## Six results, if you read nothing else

- Under `SutraPremises` (reading `R1`), each of the seven candidate places is
  refuted; the main theorem is `seven_refutations`. The nineteen premises are
  jointly satisfiable (`sutra_premises_satisfiable`), so the refutation is not
  an artefact of an inconsistent premise set.
- The refutation of H1 (mind inside the body) depends on a presence-principle
  premise (A01: if the mind is inside, it should see the viscera). Under a
  channel-principle theory of perception (seeing requires a sensory channel;
  the viscera have none), there is a model in which the mind is inside the
  body, so H1 is not refuted (`H1_not_refuted_by_modern`). The two theories
  disagree exactly on A01 (`brainWorld_violates_A01`).
- H6 (mind between sense and object) has two proofs from different premise
  subsets: the text's dilemma (`L6`, premises A10a–A10c) and a shortcut through
  "the mind has no body" (`L6_shortcut`, premises A09a–A09c and A10c). The
  dilemma is dispensable under the reading that takes the one-body/many-body
  argument as general.
- H4's dilemma, as the text argues it, uses excluded middle (`L4` reports
  `Classical.choice`); with the forward form of the same premise the proof is
  constructive (`L4_of_forward` reports no axioms). The classical dependence is
  a feature of the premise's formulation, not of the argument.
- The sentence "the mind is inside the body" is false of one object and true of
  another in a single world (`key_difference`): the sutra premises and a
  "field" theory of an all-pervading discerning awareness are jointly
  satisfiable once "mind" is allowed to name two objects
  (`sutra_and_field_compatible`). This is a consistency result for the
  two-roots reading (二種根本), not evidence for it.
- No project-defined axiom appears in any dependency report; the only entries
  are Lean's three standard axioms, and only where a proof uses excluded middle.

## Quick start

```sh
lake build                 # type-checks every module; the Audit module prints the axiom reports
sh verify.sh               # build + regenerate audit/lean-axioms.txt + sorry gate
```

On Windows, `tools\check-lean.ps1` and `tools\print-axioms.ps1` do the same.
The pinned toolchain is installed by `elan` from `lean-toolchain`. No Mathlib
is required; a clean check takes seconds.

## Project map

| Area | Entry point |
| --- | --- |
| Wording rules and the claim table | [`docs/STATUS.md`](docs/STATUS.md) |
| Text witnesses, locators, commentaries | [`docs/SOURCES.md`](docs/SOURCES.md) |
| Known limits and next steps | [`docs/OPEN_PROBLEMS.md`](docs/OPEN_PROBLEMS.md) |
| Every module, its premises and source status | [`catalog/FORMALIZATION_CATALOG.md`](catalog/FORMALIZATION_CATALOG.md) |
| Axiom-dependency record | [`audit/lean-axioms.txt`](audit/lean-axioms.txt) |
| Release checklist | [`docs/RELEASE_CHECKLIST.md`](docs/RELEASE_CHECKLIST.md) |

## Relation to prior work

The method (explicit premise inventories, dependency reports, countermodels)
follows the computational-hermeneutics programme of Benzmüller and Fuenmayor
and the conventions of Ariake's *Buddhist and Comparative Asian Logic
Formalizations* (Lean 4 and Isabelle/HOL, v0.1.0, 2026-09-20, Zenodo
10.5281/zenodo.22851717), which does not cover the Śūraṅgama Sūtra. This
repository is independent of that library and adopts its source-status
vocabulary and wording discipline.

## Licence

Formalization code and scripts: Apache-2.0. Explanatory Markdown, catalogue,
audit records, and source metadata: CC0-1.0. The ancient Chinese text is in the
public domain; the project does not redistribute any modern edition,
commentary, or CBETA file. See `REUSE.toml` and `CITATION.cff`.

## How this was made

AI-assisted drafting was used during development, including Claude
(Anthropic). Proof acceptance is determined by the Lean kernel. Source
selection, reading, interpretation, and the claim boundary are human scholarly
responsibilities and are not certified by kernel checking.
