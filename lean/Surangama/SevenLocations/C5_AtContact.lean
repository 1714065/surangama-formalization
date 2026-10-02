/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C5: the contact-and-arrival interpretation, conditional proof

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

本文件核验 C5 的无体／有体两分支；有体分支才进入内出外入。
不冒称逐句覆盖一多、遍不遍等全部经文。
Claim: 阿难本次“随所合处，心则随有”的解释成立。
HasBody: 所执心体有体，即本轮讨论中的有所指，并非无所指空名。
“无体”在此指候选者全无相应所指，不等于“分别性离尘无自体”。
后者不否认依条件发生的分别活动，不能直接代入本文件的 ¬ HasBody。
CanContact: 所说的心能够与境相合。
FromInside / FromOutside: 所执能知心体从身内出／从身外入，到达相合处。
SeesInside / SeesFace: 在本段直接了知、观看的模型下见到身中／自己的脸。
不是借助镜像、影像或其他工具的观看。

原 not_at_contact 的五个显式条件（保留为有体路线工具）：
1. contact_requires_arrival：按本次有体、接触、到达的解释，若主张成立，
   则心体须内出或外入。依据 p108a01-03；圆瑛 P00700；正脉疏“因挃始来”。
   它不是从“接触”一词抽出的普遍规律，也不由结论的否定来定义 Claim。
2-3. 内出应见身中／外入应先见面：经文的条件反诘与注疏解释。
4-5. 本段所采用的不见身中／不直接见面：圆瑛 P00700“今二俱不见”。

这里把“心体的知如何连接见”的解释保留在条件 2-3 中，未独立证明它。
新主汇总 not_at_contact_all_cases 显式加入有体／无体分类、主张要求能合、
无体不能合；原到达条件改为 Claim → HasBody → 内出或外入。
无体分支不使用内外条件。分类命题作为参数，不暗中导入经典逻辑公理。
十九界／七尘作为无体虚名相合的反诘，由独立引理说明怎样提供无体不能合条件；
FictitiousCombination 只是命名其后果，不将该后果直接定义为 False。
一多、遍不遍、门眼比喻不增加主汇总依赖。
不检验现代神经模型，不否定认识活动依条件发生，不证明真心的本体属性。
-/

namespace Surangama.SevenLocations.C5ContactConditional

theorem not_at_contact
    (Claim FromInside FromOutside SeesInside SeesFace : Prop)
    (contact_requires_arrival : Claim → FromInside ∨ FromOutside)
    (inside_requires_sight : FromInside → SeesInside)
    (outside_requires_face : FromOutside → SeesFace)
    (no_inside_sight : ¬ SeesInside)
    (no_direct_face : ¬ SeesFace) : ¬ Claim := by
  intro claim
  rcases contact_requires_arrival claim with from_inside | from_outside
  · exact no_inside_sight (inside_requires_sight from_inside)
  · exact no_direct_face (outside_requires_face from_outside)

/-- 十九界／七尘反诘：虚名相合的迁移与不可接受性都作为显式条件。 -/
theorem no_body_no_contact_from_empty_example
    (HasBody CanContact FictitiousCombination : Prop)
    (empty_transfer : ¬ HasBody → CanContact → FictitiousCombination)
    (no_fictitious_combination : ¬ FictitiousCombination) :
    ¬ HasBody → ¬ CanContact := by
  intro no_body contact
  exact no_fictitious_combination (empty_transfer no_body contact)

/-- 无体分支：主张仍要求能合，而无体条件不允许能合。 -/
theorem not_at_contact_without_body
    (Claim HasBody CanContact : Prop)
    (claim_requires_contact : Claim → CanContact)
    (no_body_no_contact : ¬ HasBody → ¬ CanContact)
    (no_body : ¬ HasBody) : ¬ Claim := by
  intro claim
  exact no_body_no_contact no_body (claim_requires_contact claim)

/-- 有体分支：明确获得有体假设，才准许使用内出／外入条件。 -/
theorem not_at_contact_with_body
    (Claim HasBody FromInside FromOutside SeesInside SeesFace : Prop)
    (body : HasBody)
    (embodied_contact_requires_arrival : Claim → HasBody → FromInside ∨ FromOutside)
    (inside_requires_sight : FromInside → SeesInside)
    (outside_requires_face : FromOutside → SeesFace)
    (no_inside_sight : ¬ SeesInside)
    (no_direct_face : ¬ SeesFace) : ¬ Claim := by
  exact not_at_contact Claim FromInside FromOutside SeesInside SeesFace
    (fun claim => embodied_contact_requires_arrival claim body)
    inside_requires_sight outside_requires_face no_inside_sight no_direct_face

/-- 主汇总：无体不能合；有体才检查内出外入，分别得到矛盾。 -/
theorem not_at_contact_all_cases
    (Claim HasBody CanContact FromInside FromOutside SeesInside SeesFace : Prop)
    (body_cases : HasBody ∨ ¬ HasBody)
    (claim_requires_contact : Claim → CanContact)
    (no_body_no_contact : ¬ HasBody → ¬ CanContact)
    (embodied_contact_requires_arrival : Claim → HasBody → FromInside ∨ FromOutside)
    (inside_requires_sight : FromInside → SeesInside)
    (outside_requires_face : FromOutside → SeesFace)
    (no_inside_sight : ¬ SeesInside)
    (no_direct_face : ¬ SeesFace) : ¬ Claim := by
  rcases body_cases with body | no_body
  · exact not_at_contact_with_body Claim HasBody FromInside FromOutside SeesInside SeesFace
      body embodied_contact_requires_arrival inside_requires_sight
      outside_requires_face no_inside_sight no_direct_face
  · exact not_at_contact_without_body Claim HasBody CanContact
      claim_requires_contact no_body_no_contact no_body

end Surangama.SevenLocations.C5ContactConditional
