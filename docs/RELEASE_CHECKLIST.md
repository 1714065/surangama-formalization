<!-- SPDX-License-Identifier: CC0-1.0 -->

# Release checklist (v1.0; previous release history retained)

<!-- project-principle:2026-09-29 -->
> **项目共同原则（2026-09-29）**
>
> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。
<!-- /project-principle -->

## v1.0 publication checks

- Full build, axiom report, both Boolean scope audits and no proof placeholders.
- The seven existing module contents must match v0.2.1; eight shared declarations are additional.
- Public manuscripts must contain the approved text, matching bilingual code and working reading links.
- Exclude private author-review backups, conversation archives and credentials; retain separate manuscript rights.
- Require successful GitHub CI on the exact release commit before publication.
- Verify the new Zenodo version, concept DOI and all archived files against the immutable v1.0 tag.

## v0.2.1 publication checks

- Compare all seven renamed file contents to v0.2.0: identical.
- Build and audit using new imports; regenerate the finite scope report.
- Verify public/private source copies, embedded code and active local links.
- Require successful GitHub CI on the exact commit before publishing.
- Verify the new Zenodo record and all archived files against the release tag.

## v0.2.0 publication checks

- Full Lean build, no proof placeholders, regenerated axiom report.
- `python tools/check_scope.py` regenerates `audit/propositional-scope.json`; selected formulas are consistent and each substantive omission admits the target.
- Seven current modules: 49 declarations; historical Core is separately described.
- Research guide, module notes and all public links operate without the private workspace.
- `lakefile.toml` and `CITATION.cff` identify 0.2.0; the old version DOI is not reused.
- Verify GitHub CI on the exact release commit before tagging/publishing.
- Publish the GitHub release; verify the resulting Zenodo record has v0.2.0, the same concept DOI, and the correct archived files.

## Initial v0.1.0 identity fields

| File | Field | Status |
| --- | --- | --- |
| `CITATION.cff` | author name | filled: Wu, Jason (2026-09-25) |
| `CITATION.cff`, `README.md` | contact email | filled: 1714065@qq.com |
| `CITATION.cff`, `README.md` | `orcid` | filled: 0009-0003-1682-6165 (2026-09-25) |
| `CITATION.cff` | `repository-code` | `https://github.com/1714065/surangama-formalization` (confirmed) |
| `REUSE.toml` | copyright holder (two places) | filled: 2026 Jason Wu |
| `README.md`, `CITATION.cff` | AI-assistance notice | present (Claude, Anthropic; kernel-checked proofs; human responsibility for readings and claims) |
| `CITATION.cff`, `README.md` | Zenodo DOI | filled: version 10.5281/zenodo.22950553, concept 10.5281/zenodo.22950552 (release v0.1.0 archived 2026-09-25, record appeared 2026-09-26) |

## Before tagging `v0.1.0`

1. `lake build` passes on a clean clone; `sh verify.sh` passes (sorry gate, audit regenerated).
2. `audit/lean-axioms.txt` is committed with the date of the run.
3. Every theorem name in `README.md` and `docs/STATUS.md` exists (hand check).
4. CI (`.github/workflows/verify.yml`) is green for the exact commit to be tagged.
5. Enable the GitHub–Zenodo integration for the repository, then create the GitHub release `v0.1.0`; Zenodo mints a version DOI and a concept DOI.
6. Put the Zenodo version DOI and `date-released` into `CITATION.cff`, commit, and (if Zenodo is configured to archive every release) tag `v0.1.1` or amend the release notes; do not reuse a DOI for changed content.

## Release notes must distinguish

- kernel-checked theorem statements and countermodels;
- readings (`R1`, `R2`, `Modern`) and premise statuses (dialogue-accepted / project-restatement / modern);
- locators and their status (`work_level` for CBETA in v0.1.0; `passage_aligned` for the working extraction);
- what is not claimed (truth of premises, uniqueness of reading, any empirical result).
