<!-- SPDX-License-Identifier: CC0-1.0 -->

# 心不在内：经文问答中的条件推导

<!-- project-principle:2026-09-29 -->
> **项目共同原则（2026-09-29）**
>
> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
>
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。
<!-- /project-principle -->

日期：2026-09-29。状态：本地教学增补，不属于已发布的 v0.1.0 内容。

## 本轮要做的事

根据阿难在问答中接受的比喻和判断，检查其身内定位能否与“不知内”同时成立。
本轮不讨论如何反驳意识是大脑作用的观点，也不把识精元明定义成任何实体。

这是已有 `Core.lean` 中 `L1` 的命题逻辑教学版本，单列两个实际需要的条件；
不是新增一条无条件的经学或科学结论。

## 经文与前提的对应

下列位置于本次核对本地 CBETA T19n0945 正文快照及圆瑛、宣化、成观注解后记录。
定位状态为 `passage_aligned`，不表示完成版本校勘。
本地快照位于 the private research workspace (not required for the public build)；
本仓不再分发原典快照或现代注疏。

| 项目 | 经文根据 | 本次重建中的角色 |
| --- | --- | --- |
| 阿难的身内定位 | 卷一 p107a12–15：“如是识心，实居身内” | 待否定主张 `Inside`；没有当作已成立前提 |
| 在内应知内 | p107a26–b05：讲堂问答及佛陀“若……实在身内，尔时先合了知内身” | `inside_requires_inner_knowing`；`project-restatement`，明确保留的连接条件 |
| 阿难对类比的接受 | p107a19–21、a28–29：堂内先见如来、后见林园；p107b06–11：阿难主动使用灯喻，转执身外 | `dialogue-accepted` 的文本依据；灯喻是后续回应，不能写成最初已明说的前提 |
| 不具备所要求的身内明了 | p107b09：“一切众生不见身中独见身外”；b25：“此了知心既不知内而能见外” | `no_inner_knowing`；对话中的经验断言，经项目限定后写成命题，不是独立实证结果 |
| 后续修正与质疑 | p108a04：“见是其眼，心知非眼，为见非义” | 说明阿难的解释在变化；不把后续转计合并为一个不变模型 |

`KnowsInside` 指本段所要求的对身内的直接明了，不是说人完全没有内感、痛感，
也不是通过解剖、仪器或学习得到的知识。这里以一个命题概括“知内”要求，
没有编码“先”的时间次序，也没有完整编码“纵不能见心肝脾胃”之后的退让与追问。

阿难没有先宣称“我能够看见心肝脾胃、明了爪生发长”。应有能力是佛陀反诘提出的；
阿难随后用灯喻解释自身立场，是其接受该推理方向的证据。
由照明关系迁移到认知关系是否普遍有效，仍是形式化之外的解释问题。

## 大白话证明

1. 本次接受：如果这个识心住在身内，就应具备上述身内明了。
2. 本次接受：它不具备上述身内明了。
3. 暂时假设：它住在身内。
4. 由第 1、3 项得到“知内”，与第 2 项“不知内”冲突。
5. 因而，在这两个前提下，不能坚持这个身内定位。

“能见外”参与经文提出问题及支持类比的过程；在这个压缩后的条件推导中，
它不是第三个必要参数。爱乐也用于辨认对话所讨论的心，没有另写成推理前提。

## Lean 代码

源文件：[InsideConditional.lean](../lean/Surangama/SevenLocations/InsideConditional.lean)。

```lean
theorem not_inside
    (Inside KnowsInside : Prop)
    (inside_requires_inner_knowing : Inside → KnowsInside)
    (no_inner_knowing : ¬ KnowsInside) :
    ¬ Inside := by
  intro inside
  have knows_inside : KnowsInside := inside_requires_inner_knowing inside
  exact no_inner_knowing knows_inside
```

`Inside` 与 `KnowsInside` 是两句话，不是两个实体；声明它们为 `Prop` 不代表已经证明它们。
`inside` 是暂时假设下“在内”的证明，`knows_inside` 是据此推出的“知内”的证明。
最后一行将“知内”的证明交给“不知内”这个前提，得到矛盾 `False`，不是得到一个新的“不知内”证明。
`¬ Inside` 的意思是：只要有人给出 `Inside` 的证明，便会在当前前提下导出矛盾。

## 前提与依赖检查

主定理全名：`Surangama.SevenLocations.InsideConditional.not_inside`。
两个前提是定理参数，没有声明为全局公理。
`#print axioms` 即使显示空清单，也不表示没有条件；须同时阅读定理声明。

源文件另有三个纯逻辑取值证明：

| 定理 | 取值或含义 |
| --- | --- |
| `premises_have_model` | `Inside = False`、`KnowsInside = False` 满足两个前提，排除仅因前提自相矛盾而推出结论的情况 |
| `without_bridge_allows_inside` | 去掉连接条件后，`Inside = True`、`KnowsInside = False` 仍满足剩余条件 |
| `without_no_inner_knowing_allows_inside` | 去掉“不知内”后，`Inside = True`、`KnowsInside = True` 仍满足剩余条件 |

这些是命题的真假取值，不是现实心或大脑的模型。

复核命令（在仓库根目录执行）：

```powershell
./tools/check-lean.ps1
./tools/print-axioms.ps1
```

依赖输出见 [audit/lean-axioms.txt](../audit/lean-axioms.txt)。

## 结论怎么说

可以说：在列明的两个前提下，`not_inside` 排除了本次重建中的身内定位。

不能据此说：所有身内认知理论都已被否定、心必在身外、心绝无任何空间关系，
或我们已经确定佛、如来藏究竟是什么。本轮也没有证明那些前提本身为真。
