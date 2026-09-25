<!-- SPDX-License-Identifier: CC0-1.0 -->

# Release checklist (v0.1.0)

## Placeholders to fill before the first push

| File | Placeholder | Fill with |
| --- | --- | --- |
| `CITATION.cff` | `<FAMILY NAME>`, `<GIVEN NAME>` | the author name as it should be cited |
| `CITATION.cff` | `# orcid:` (commented) | an ORCID iD (free at https://orcid.org); uncomment the line |
| `CITATION.cff` | `repository-code` | keep if the repository is `github.com/1714065/surangama-formalization`; otherwise edit |
| `REUSE.toml` | `2026 <AUTHOR NAME>` (two places) | the copyright holder name |

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
