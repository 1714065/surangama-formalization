<!-- SPDX-License-Identifier: CC0-1.0 -->

# v0.2.1 — numbered, descriptive Lean filenames

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

C1 was present in v0.2.0 as `InsideConditional.lean`, but that name obscured
its place in the seven-location series. This release gives all seven current
modules numbered English filenames, matching the research copies.

| 编号 | v0.2.0 正式文件 | 旧研究副本 | v0.2.1 两目录统一文件名 |
| --- | --- | --- | --- |
| C1 | `InsideConditional.lean` | `InsideConditional.lean` | `C1_Inside.lean` |
| C2 | `C2.lean` | `C2.lean` | `C2_Outside.lean` |
| C3 | `C3.lean` | `SevenLocationsC3.lean` | `C3_InRoot.lean` |
| C4 | `C4.lean` | `SevenLocationsC4.lean` | `C4_LightAndDarkness.lean` |
| C5 | `C5.lean` | `C5ContactConditional.lean` | `C5_AtContact.lean` |
| C6 | `C6.lean` | `SevenLocationsC6.lean` | `C6_Middle.lean` |
| C7 | `C7.lean` | `SevenLocationsC7.lean` | `C7_Unlocated.lean` |


## Scope of the change

- All seven proof files are unchanged in content relative to v0.2.0: 49 theorem declarations, with the same hypotheses, proofs and declaration namespaces.
- Aggregate and audit imports, scope-checker paths, public research notes and source links now use the new filenames.
- Research-workspace notes, training pages, generators and source copies have been synchronized separately.
- Existing direct imports of individual old module paths need the migration in [FILE_NAMING.md](FILE_NAMING.md); `import Surangama` and theorem names remain stable.

Reproduce with `sh verify.sh` (the pinned Lean toolchain and Python 3), or
the Windows Lean scripts and `python tools/check_scope.py`. This is still a
conditional-formalization software release; its interpretive claim boundaries
are unchanged. Earlier published archives retain their own filenames.

The concept DOI remains `10.5281/zenodo.22950552`. The v0.2.1 version DOI is
assigned by Zenodo after publication; `10.5281/zenodo.23107913` identifies
v0.2.0, not this update.
