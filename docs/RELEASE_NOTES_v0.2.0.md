<!-- SPDX-License-Identifier: CC0-1.0 -->

# v0.2.0 — explicit-premise reconstructions of C1–C7

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

The seven-location argument is now available as seven independently readable
modules with explicit theorem parameters. The v0.1.0 `Core` and
`Countermodels` are retained unchanged; the new modules do not silently
replace their readings or combine their premise sets.

## Added

- C1 and C2: two-premise refutations with satisfiability and premise-omission witnesses.
- C3: the not-seeing and seeing-eye branches, with a three-premise combined refutation.
- C4: ordinary darkness and inward-viewing routes, separate ownership and two-knowers follow-ups, and a supplementary dark-room argument.
- C5: no-body and body branches, with arrival from inside/outside used only after the body assumption.
- C6: both affiliations, root only, object only, and neither; the two single-side bridges are explicit project reconstructions.
- C7: absent/present candidate branches; form-to-location is explicitly a hypothesis.
- A public [Chinese research guide](RESEARCH_GUIDE_zh.md), [standalone HTML with foldable verified code](RESEARCH_GUIDE_zh.html), per-passage premise/source mappings, and `tools/check_scope.py` with a reproducible JSON audit.

## Verification and limits

The seven new modules contain **49 theorem declarations**, including branch
lemmas and scope witnesses. All have empty axiom-dependency lists while
retaining their explicit premises. C5–C7 receive logical case splits as
parameters. Historical Core proofs retain their recorded standard classical
axiom dependencies where applicable.

The finite audit checks consistency and a witness for every single substantive
premise omission for each main formula, plus the C4 extended route. It is a
Boolean audit of transcribed formulas, not an empirical consciousness model or
a machine-certified interpretation of scripture.

C5 does not formalize every one/many or pervasive/nonpervasive branch; C6 does
not formalize the body-center and marker-direction preliminaries. No proof of
premise truth, uniquely correct reading, mind-brain theory, or the ontology of
Buddha/Tathagatagarbha is claimed. No assertion of peer-reviewed publication is
made: this release archives formalization software and supporting research notes.

## Reproduction

Pinned toolchain: `leanprover/lean4:v4.35.0-rc2`; no Mathlib.
Run `sh verify.sh` with Lean and Python 3, or the Windows Lean scripts followed
by `python tools/check_scope.py`. Reports are in `audit/`.

## Citation and provenance

Author: Jason Wu. Development used Claude (Anthropic) and Codex (OpenAI) under
human direction; interpretive responsibility remains with the author.
Concept DOI for the version family: `10.5281/zenodo.22950552`.
The v0.1.0 DOI `10.5281/zenodo.22950553` identifies the initial release only.
The version DOI is [10.5281/zenodo.23107913](https://doi.org/10.5281/zenodo.23107913). See [the verified publication record](RELEASE_RECORD_v0.2.0.md).
