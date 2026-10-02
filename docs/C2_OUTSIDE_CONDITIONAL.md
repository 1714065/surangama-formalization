<!-- SPDX-License-Identifier: CC0-1.0 -->

# C2 · 心在外：两个明确前提下的反驳

<!-- project-principle:2026-09-29 -->
> **项目共同原则（2026-09-29）**
>
> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。
<!-- /project-principle -->

日期：2026-09-30。本地增补，不属于已发布的 v0.1.0 内容。
编号为用户指定的 **C2**；不是旧版议题清单 C-2（识心离尘无体）。

源文件：[C2_Outside.lean](../lean/Surangama/SevenLocations/C2_Outside.lean)。
主定理：`Surangama.SevenLocations.C2.not_outside`。
这是既有 `L2` 的两个前提单列版本，没有导入整套七处征心前提。

## 命题、前提与经文

| 项目 | 形式写法 | 含义及依据 |
| --- | --- | --- |
| 待反驳主张 | `Outside` | 阿难本段所执的觉了知见之心住在身外；T19 卷一 p107b06–11 |
| 本段相知 | `BodyMindKnowTogether` | 眼见佛手时，心有相应分别了知；不表示全知或身心实体同一 |
| 连接前提 | `Outside → ¬ BodyMindKnowTogether` | p107b16–18“身心相外，自不相干”；`project-restatement`，不是证明了普遍空间规律 |
| 经验前提 | `BodyMindKnowTogether` | p107b18–19，阿难回答“如是”；`dialogue-accepted`，不是独立实验结果 |
| 后续接受证据 | 不另作定理参数 | p107b22–24，阿难复述“身心相知，不相离故，不在身外” |

来源状态：`passage_aligned`。依据本地研究札记及 CBETA 正文快照的逐段核对，
并参照圆瑛 P00590、P00595–P00596，宣化 X01529–X01540，成观 PDF物理页61–62。
P/X 是项目核对本的段落编号，不是原书页码。

原研究札记：the private research workspace (not required for the public build)。
原典和现代注疏不在本仓重新分发。

## 大白话证明

先接受：在外则不相知；实际相知。
暂时假设在外，则由第一个前提得到不相知，与第二个前提冲突。
所以，在这两个条件下，非在外。

源码的 `intro outside` 接下临时假设；`have not_knowing` 推出不相知；
`exact not_knowing body_mind_know_together` 将相知的证据交给不相知，得到矛盾。
两个前提都是定理参数；没有声明全局公理。

## 检查与结论范围

源码另给出三个真假取值证明：两个前提可同时满足；去掉任意一个前提，
都仍容许身外命题为真。这些取值不是现实心的模型。

在仓库根目录运行：

```powershell
./tools/check-lean.ps1
./tools/print-axioms.ps1
```

依赖记录：[audit/lean-axioms.txt](../audit/lean-axioms.txt)。
`#print axioms` 无公理依赖不等于没有上述两个条件。

可说：在明确前提下，C2 排除了本次重建中的身外定位。
不能据此说：空间分离必定不能相互关联、心在身内、身心本体同一，
或已经证明佛、如来藏是什么。意识与大脑作用的议题留待后续。
