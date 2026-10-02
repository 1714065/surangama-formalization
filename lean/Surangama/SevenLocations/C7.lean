/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C7 · 一切无著：有体／无体两路的条件反驳

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

依据：T19n0945 卷一 p108b04–14；docs/C7_UNLOCATED_CONDITIONAL.md。
采用用户确认的心体有无路线，不合并《正脉疏》所不著之物有无的另一读法。
本段“无著”限定为全无所在，不指修行中的不贪染。
不导入整套 SutraPremises，不改变既有 Core.L7。

命题的工作解释：
* Claim：阿难认定的觉知分别心可以“一切无著＝全无所在”成立。
* HasBody：本次被指认的候选心体确有所指；不是物质身体或肉身。
* HasForm：该候选心体具有此模型的体相，不专指可见形状。
* Knower：该候选者能担当此解释所声称的觉知者。
* Located：该候选心体有某个所在；全篇使用同一意义。

四项实质条件：
1. claim_content：主张要求能担当觉知者，并且全无所在。
2. no_body_no_knower：全无心体的空名不能担当所声称的觉知者。
3. body_has_form：本段模型中，若有心体则有体相。
4. form_has_location：本段模型中，有体相则有所在（关键连接）。
另有显式逻辑分类 HasBody ∨ ¬ HasBody；不隐藏调用经典排中律。

这是对指定解释的反驳，不独立裁定真心有体或无体。
无体支不禁止对虚构对象说否定句；有体支不确立万物存在必占空间。
“找不到具体位置”不等于“没有任何所在”；本定理针对后者。
-/

namespace Surangama.SevenLocations.C7

/-- 无体支：空名不能担当觉知者，与原主张要求冲突。 -/
theorem not_unlocated_without_body (Claim HasBody Knower : Prop)
    (claim_requires_knower : Claim → Knower)
    (no_body_no_knower : ¬ HasBody → ¬ Knower)
    (no_body : ¬ HasBody) : ¬ Claim := by
  intro claim
  have knower : Knower := claim_requires_knower claim
  exact no_body_no_knower no_body knower

/-- 有体支：有体 → 有体相 → 有所在，与原主张的全无所在冲突。 -/
theorem not_unlocated_with_body (Claim HasBody HasForm Located : Prop)
    (claim_requires_no_location : Claim → ¬ Located)
    (body_has_form : HasBody → HasForm)
    (form_has_location : HasForm → Located)
    (body : HasBody) : ¬ Claim := by
  intro claim
  have form : HasForm := body_has_form body
  have located : Located := form_has_location form
  -- 有所在的依据交给无所在的否定，得到矛盾。
  exact claim_requires_no_location claim located

/-- 主汇总：一项逻辑分类、四项实质条件，反驳此“无所在之觉知心”解释。 -/
theorem not_unlocated_all_cases (Claim HasBody HasForm Knower Located : Prop)
    (body_cases : HasBody ∨ ¬ HasBody)
    (claim_content : Claim → Knower ∧ ¬ Located)
    (no_body_no_knower : ¬ HasBody → ¬ Knower)
    (body_has_form : HasBody → HasForm)
    (form_has_location : HasForm → Located) : ¬ Claim := by
  rcases body_cases with body | no_body
  · exact not_unlocated_with_body Claim HasBody HasForm Located
      (fun claim => (claim_content claim).2)
      body_has_form form_has_location body
  · exact not_unlocated_without_body Claim HasBody Knower
      (fun claim => (claim_content claim).1)
      no_body_no_knower no_body

end Surangama.SevenLocations.C7
