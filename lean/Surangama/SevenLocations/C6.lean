/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C6 · 心在中间：四类关系的条件反驳

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

依据：T19n0945 卷一 p108a15–b03；docs/C6_MIDDLE_CONDITIONAL.md。
主证明覆盖根尘中间之计的四种关系；身体中央、标杆方位不纳入此汇总。
不导入整套 SutraPremises，不改变既有 Core.L6。

命题是工作解释，不是心的本体定义：
* Claim：本段“识生其中，则为心在”的根尘中间心体解释成立。
* Root / Dust：该候选心体分别兼属根方／尘方；全篇使用同一关系。
* Middle：所主张的区别于单独两边的中间地位成立。
* HasNature：此模型所立心体具有相应体性。
* Opposed：兼两边后，根之有知与尘之无知仍对立两立。
* RootSide / DustSide：心体完全归属根一边／尘一边。

八个实质条件均显式传入：主张须成立中间地位及体性；兼二导致两立；
两立不成中；只兼根则完全归根；归根不成中；只兼尘则完全归尘；
归尘不成中；全不兼则无此模型所立体性。
两条“只兼一”是用户确认的项目补全，并非原文另列的两段。
因果依赖不自动等于完全归属；不同部分有不同性质不自动是逻辑矛盾。

两个逻辑分类条件 Root ∨ ¬ Root、Dust ∨ ¬ Dust 显式传入。
无隐藏的经典排中律调用；空公理依赖仍不等于无上述条件。
旧项目“C-6 六根互用／换基”与本模块无关。
-/

namespace Surangama.SevenLocations.C6

/-- 对同一兼属关系逐项分类，得到互斥的四种组合。 -/
theorem four_cases (Root Dust : Prop)
    (root_cases : Root ∨ ¬ Root) (dust_cases : Dust ∨ ¬ Dust) :
    (Root ∧ Dust) ∨ (Root ∧ ¬ Dust) ∨
      (¬ Root ∧ Dust) ∨ (¬ Root ∧ ¬ Dust) := by
  rcases root_cases with root | no_root
  · rcases dust_cases with dust | no_dust
    · exact Or.inl ⟨root, dust⟩
    · exact Or.inr (Or.inl ⟨root, no_dust⟩)
  · rcases dust_cases with dust | no_dust
    · exact Or.inr (Or.inr (Or.inl ⟨no_root, dust⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨no_root, no_dust⟩))

/-- 兼两边：按给定解释形成两立，与主张所需的中间地位冲突。 -/
theorem not_middle_of_both (Claim Root Dust Middle Opposed : Prop)
    (claim_requires_middle : Claim → Middle)
    (both_opposed : Root → Dust → Opposed)
    (opposed_not_middle : Opposed → ¬ Middle)
    (root : Root) (dust : Dust) : ¬ Claim := by
  intro claim
  have middle : Middle := claim_requires_middle claim
  have opposed : Opposed := both_opposed root dust
  exact opposed_not_middle opposed middle

/-- 只兼根：经完全归属根方的连接，不成所主张的中间。 -/
theorem not_middle_of_root_only (Claim Root Dust Middle RootSide : Prop)
    (claim_requires_middle : Claim → Middle)
    (root_only_at_side : Root → ¬ Dust → RootSide)
    (root_side_not_middle : RootSide → ¬ Middle)
    (root : Root) (no_dust : ¬ Dust) : ¬ Claim := by
  intro claim
  have middle : Middle := claim_requires_middle claim
  have root_side : RootSide := root_only_at_side root no_dust
  exact root_side_not_middle root_side middle

/-- 只兼尘：经完全归属尘方的连接，不成所主张的中间。 -/
theorem not_middle_of_dust_only (Claim Root Dust Middle DustSide : Prop)
    (claim_requires_middle : Claim → Middle)
    (dust_only_at_side : ¬ Root → Dust → DustSide)
    (dust_side_not_middle : DustSide → ¬ Middle)
    (no_root : ¬ Root) (dust : Dust) : ¬ Claim := by
  intro claim
  have middle : Middle := claim_requires_middle claim
  have dust_side : DustSide := dust_only_at_side no_root dust
  exact dust_side_not_middle dust_side middle

/-- 全不兼：按此模型无所立体性，与主张须有该体性冲突。 -/
theorem not_middle_of_neither (Claim Root Dust HasNature : Prop)
    (claim_requires_nature : Claim → HasNature)
    (neither_no_nature : ¬ Root → ¬ Dust → ¬ HasNature)
    (no_root : ¬ Root) (no_dust : ¬ Dust) : ¬ Claim := by
  intro claim
  have nature : HasNature := claim_requires_nature claim
  exact neither_no_nature no_root no_dust nature

/-- 主汇总：两项逻辑分类、八项实质条件，排除四种关系下的中间主张。 -/
theorem not_in_middle_four_cases
    (Claim Root Dust Middle HasNature Opposed RootSide DustSide : Prop)
    (root_cases : Root ∨ ¬ Root)
    (dust_cases : Dust ∨ ¬ Dust)
    (claim_content : Claim → Middle ∧ HasNature)
    (both_opposed : Root → Dust → Opposed)
    (opposed_not_middle : Opposed → ¬ Middle)
    (root_only_at_side : Root → ¬ Dust → RootSide)
    (root_side_not_middle : RootSide → ¬ Middle)
    (dust_only_at_side : ¬ Root → Dust → DustSide)
    (dust_side_not_middle : DustSide → ¬ Middle)
    (neither_no_nature : ¬ Root → ¬ Dust → ¬ HasNature) : ¬ Claim := by
  -- 从主张取得两项要求，不把要求藏入 Claim 的定义。
  have requires_middle : Claim → Middle := fun claim => (claim_content claim).1
  have requires_nature : Claim → HasNature := fun claim => (claim_content claim).2
  -- “不兼二”展开为只兼根、只兼尘、全不兼，没有漏掉只兼一。
  rcases four_cases Root Dust root_cases dust_cases with both | only_root | only_dust | neither
  · exact not_middle_of_both Claim Root Dust Middle Opposed
      requires_middle both_opposed opposed_not_middle both.1 both.2
  · exact not_middle_of_root_only Claim Root Dust Middle RootSide
      requires_middle root_only_at_side root_side_not_middle only_root.1 only_root.2
  · exact not_middle_of_dust_only Claim Root Dust Middle DustSide
      requires_middle dust_only_at_side dust_side_not_middle only_dust.1 only_dust.2
  · exact not_middle_of_neither Claim Root Dust HasNature
      requires_nature neither_no_nature neither.1 neither.2

end Surangama.SevenLocations.C6
