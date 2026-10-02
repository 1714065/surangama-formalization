<!-- SPDX-License-Identifier: CC0-1.0 -->

# C1—C7 file naming · v0.2.1

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

All seven files now use the pattern `C<number>_<EnglishName>.lean` in both
the public project's `lean/Surangama/SevenLocations/` directory and the
research workspace's `lean/` directory.

| 编号 | v0.2.0 正式文件 | 旧研究副本 | v0.2.1 两目录统一文件名 |
| --- | --- | --- | --- |
| C1 | `InsideConditional.lean` | `InsideConditional.lean` | `C1_Inside.lean` |
| C2 | `C2.lean` | `C2.lean` | `C2_Outside.lean` |
| C3 | `C3.lean` | `SevenLocationsC3.lean` | `C3_InRoot.lean` |
| C4 | `C4.lean` | `SevenLocationsC4.lean` | `C4_LightAndDarkness.lean` |
| C5 | `C5.lean` | `C5ContactConditional.lean` | `C5_AtContact.lean` |
| C6 | `C6.lean` | `SevenLocationsC6.lean` | `C6_Middle.lean` |
| C7 | `C7.lean` | `SevenLocationsC7.lean` | `C7_Unlocated.lean` |


This is a file/module-path change only. The contents of every renamed Lean
file are identical to its v0.2.0 counterpart. The 49 theorem declarations,
their names, namespaces, hypotheses and proofs are unchanged. For example,
import `Surangama.SevenLocations.C1_Inside` and still refer to
`Surangama.SevenLocations.InsideConditional.not_inside`.

The aggregate `import Surangama` continues to work. Direct importers of the
old individual module paths must adopt the new paths in this table. Old
module files are not duplicated as aliases. Historical `Core` and
`Countermodels` are unchanged. Unrelated private exploratory files named
`C1.lean`, `C3.lean` and `C6.lean` retain their original meanings.

Published v0.1.0 and v0.2.0 tags/DOIs retain their original files. Use the new
release to obtain the uniform filenames; no old archived version is replaced.
