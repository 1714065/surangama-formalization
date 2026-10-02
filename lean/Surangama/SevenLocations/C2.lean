/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C2 · 七处征心第二处：“心在外”的条件反驳

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

依据：项目《研究札记_心在外_逻辑与论据_20260930》。
原文：T19n0945 卷一 p107b06–24。见 docs/C2_OUTSIDE_CONDITIONAL.md。
本例将既有 L2 使用的两个条件单独列出，不导入全部 SutraPremises。

命题的工作解释（不是对心或如来藏作本体定义）：
* Outside：阿难本段所执的觉了知见之心住在身外。
* BodyMindKnowTogether：本段眼见佛手时，心有相应的分别了知。
  “相知”仅指这一具体关联，不表示身心知晓彼此的一切状态。

两个明确前提：
* outside_prevents_knowing：在外则不相知。
  对应 p107b16–18“若……实在身外，身心相外，自不相干……”。
  这是本次重建保留的连接条件，不是由空间距离本身证明的普遍规律，
  也没有偷偷加入 Outside 的定义。
* body_mind_know_together：实际相知。
  对应 p107b18–19“汝眼见时，心分别不？”以及阿难回答“如是”。
  p107b22–24 阿难复述“身心相知，不相离故，不在身外”，
  是其承接该推理方向的后续证据。

“一人食不能令众饱”（p107b12–16）是连接条件的比喻背景，
不另作一个已经证明“不同个体绝无认知联系”的定理。
本文件核对条件推导，不验证经验前提或类比迁移本身；
不由非在外推出在内、本体同一或一切空间范畴都不适用。
意识与大脑作用的争论留待后续，不在本定理的结论中。
-/

namespace Surangama.SevenLocations.C2

/-- 在外则不相知；而实际相知；所以在这些条件下，非在外。 -/
theorem not_outside
    (Outside BodyMindKnowTogether : Prop)
    (outside_prevents_knowing : Outside → ¬ BodyMindKnowTogether)
    (body_mind_know_together : BodyMindKnowTogether) :
    ¬ Outside := by
  -- 暂时假设阿难所说的识心在身外。
  intro outside
  -- 用第一个前提，得到“不相知”。
  have not_knowing : ¬ BodyMindKnowTogether := outside_prevents_knowing outside
  -- 把第二个前提“相知”交给“不相知”，得到矛盾，排除临时假设。
  exact not_knowing body_mind_know_together

/-! ## 范围核对：以下仅为逻辑真假取值，不是现实心或大脑的模型 -/

/-- “在外”为假、“相知”为真，可以同时满足两个前提。 -/
theorem premises_have_model :
    ∃ (Outside BodyMindKnowTogether : Prop),
      (Outside → ¬ BodyMindKnowTogether) ∧ BodyMindKnowTogether := by
  exact ⟨False, True, (fun outside => False.elim outside), True.intro⟩

/-- 只留下“实际相知”，仍容许“在外”为真：不能省去连接条件。 -/
theorem without_bridge_allows_outside :
    ∃ (Outside BodyMindKnowTogether : Prop), BodyMindKnowTogether ∧ Outside := by
  exact ⟨True, True, True.intro, True.intro⟩

/-- 只留下“在外则不相知”，仍容许“在外”为真：不能省去经验前提。 -/
theorem without_knowing_allows_outside :
    ∃ (Outside BodyMindKnowTogether : Prop),
      (Outside → ¬ BodyMindKnowTogether) ∧ Outside := by
  exact ⟨True, False, (fun _ not_knowing => not_knowing), True.intro⟩

end Surangama.SevenLocations.C2
