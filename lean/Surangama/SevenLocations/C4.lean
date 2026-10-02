/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C4 · 见暗名见内：分支与连续追问的条件重建

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

依据：T19n0945 卷一 p107c09–23，及 docs/C4_DARKNESS_CONDITIONAL.md。
本文件不导入整套 SutraPremises，不改既有 Core.L4 的范围。

命题是本段的工作解释，不是对心的本体定义：
* Claim：以“见暗名见内”补救身内定位的本次解释成立。
* Ordinary：把通常根尘相对所见的暗直接认作见内的解释成立。
* SeesDark：见到本段的暗境；不是无见。
* FacesEye：暗境与眼根构成本段成见的根尘相对关系。
* InnerEvidence：仅凭这里的暗境，就已确证见到自身内部。
* Inward：以直接返观自身内部解释闭眼见暗的补救成立。
* SeesFace：按同一返观能力直接见到自己的脸，不指镜像或影像。
* Outside：在本段直接相对观看模型中，心眼被安置于身体外部。

重要连接条件都显式列出：
seeing_requires_facing 是根尘相对之必要条件的正向写法。
facing_excludes_inner_evidence 限于本段“所见暗即内身”的认定；
它不是“外尘一律位于皮肤之外”，也不否定一切内身认识。
inward_requires_face 采用注疏的开合返观一致性解释。
face_requires_outside 采用本段直接相对观看模型，不是普遍光学定律。
inward_requires_inside 保留阿难要补救的身内定位要求。

主汇总只涵盖 claim_routes 明列的普通见暗解释与返观解释。
它在见面导致位置冲突处已足够反驳；后续自身归属、二知及暗室反例
各有独立条件推导，不冒称它们都是主汇总的必要依赖。
TwoKnowers 指两个分别独立的能知主体，不是两种感官或认知功能。
TwoBuddhas 只命名经文反诘的后果；不定义佛是什么。
-/

namespace Surangama.SevenLocations.C4

/-- 不与眼对则不成见：由成见所需的根尘关系得到。 -/
theorem not_seeing_without_facing
    (SeesDark FacesEye : Prop)
    (seeing_requires_facing : SeesDark → FacesEye)
    (not_facing : ¬ FacesEye) : ¬ SeesDark := by
  intro sees_dark
  exact not_facing (seeing_requires_facing sees_dark)

/-- 见暗须对眼；对眼之暗不足以构成本段所声称的见内确证。 -/
theorem not_ordinary_darkness_explanation
    (Ordinary SeesDark FacesEye InnerEvidence : Prop)
    (ordinary_content : Ordinary → SeesDark ∧ InnerEvidence)
    (seeing_requires_facing : SeesDark → FacesEye)
    (facing_excludes_inner_evidence : FacesEye → ¬ InnerEvidence) :
    ¬ Ordinary := by
  intro ordinary
  obtain ⟨sees_dark, inner_evidence⟩ := ordinary_content ordinary
  have faces_eye : FacesEye := seeing_requires_facing sees_dark
  exact facing_excludes_inner_evidence faces_eye inner_evidence

/-- 若不见面，且所主张的返观须能见面，则返观解释不成立。 -/
theorem not_inward_when_no_face
    (Inward SeesFace : Prop)
    (inward_requires_face : Inward → SeesFace)
    (no_face : ¬ SeesFace) : ¬ Inward := by
  intro inward
  exact no_face (inward_requires_face inward)

/-- 暂许见面后，身外位置与该模型保留的身内定位相冲突。 -/
theorem not_inward_when_face
    (Inward SeesFace Outside : Prop)
    (face_requires_outside : SeesFace → Outside)
    (inward_requires_inside : Inward → ¬ Outside)
    (sees_face : SeesFace) : ¬ Inward := by
  intro inward
  exact inward_requires_inside inward (face_requires_outside sees_face)

/-- 返观须见面，见面须在外，而本模型须保持在内。 -/
theorem not_inward_explanation
    (Inward SeesFace Outside : Prop)
    (inward_requires_face : Inward → SeesFace)
    (face_requires_outside : SeesFace → Outside)
    (inward_requires_inside : Inward → ¬ Outside) : ¬ Inward := by
  intro inward
  have sees_face : SeesFace := inward_requires_face inward
  exact (not_inward_when_face Inward SeesFace Outside
    face_requires_outside inward_requires_inside sees_face) inward

/-- 主汇总：在明列的两类解释与各连接条件下，见暗认内的补救不成立。 -/
theorem not_darkness_is_inner_sight
    (Claim Ordinary Inward SeesDark FacesEye InnerEvidence SeesFace Outside : Prop)
    (claim_routes : Claim → Ordinary ∨ Inward)
    (ordinary_content : Ordinary → SeesDark ∧ InnerEvidence)
    (seeing_requires_facing : SeesDark → FacesEye)
    (facing_excludes_inner_evidence : FacesEye → ¬ InnerEvidence)
    (inward_requires_face : Inward → SeesFace)
    (face_requires_outside : SeesFace → Outside)
    (inward_requires_inside : Inward → ¬ Outside) : ¬ Claim := by
  intro claim
  -- 这里分类的是已列出的解释方式，不是对所有认知理论作穷尽断言。
  rcases claim_routes claim with ordinary | inward
  · exact (not_ordinary_darkness_explanation Ordinary SeesDark FacesEye InnerEvidence
      ordinary_content seeing_requires_facing facing_excludes_inner_evidence) ordinary
  · exact (not_inward_explanation Inward SeesFace Outside
      inward_requires_face face_requires_outside inward_requires_inside) inward

/-! ## 继续暂许后的追问：以下三类条件没有进入上面的主汇总 -/

/-- 若离体观看仍算自身的判据也把他人算作自身，则该判据不成立。 -/
theorem not_external_ownership_by_face
    (OwnershipClaim OtherIsSelf : Prop)
    (criterion_transfers_to_other : OwnershipClaim → OtherIsSelf)
    (other_is_not_self : ¬ OtherIsSelf) : ¬ OwnershipClaim := by
  intro ownership
  exact other_is_not_self (criterion_transfers_to_other ownership)

/-- 二知到两佛的反诘：两个连接条件保留为参数，不定义佛的本体。 -/
theorem not_two_knowers
    (TwoKnowers TwoBuddhas : Prop)
    (two_knowers_entail_two_buddhas : TwoKnowers → TwoBuddhas)
    (not_two_buddhas : ¬ TwoBuddhas) : ¬ TwoKnowers := by
  intro two_knowers
  exact not_two_buddhas (two_knowers_entail_two_buddhas two_knowers)

/-- 将独立能知者安置在外后，检查身非觉或二知这两种后果。 -/
theorem not_external_knower_rescue
    (ExternalRescue BodyAware TwoKnowers TwoBuddhas : Prop)
    (external_consequences : ExternalRescue → (¬ BodyAware) ∨ TwoKnowers)
    (body_aware : BodyAware)
    (two_knowers_entail_two_buddhas : TwoKnowers → TwoBuddhas)
    (not_two_buddhas : ¬ TwoBuddhas) : ¬ ExternalRescue := by
  intro external_rescue
  -- 这是所列补救模型的后果分类，不是对任何身外认识关系的断言。
  rcases external_consequences external_rescue with no_body_awareness | two_knowers
  · exact no_body_awareness body_aware
  · exact (not_two_knowers TwoKnowers TwoBuddhas
      two_knowers_entail_two_buddhas not_two_buddhas) two_knowers

/-- 即使继续允许离体能知的补救，也可沿见面、身外、身觉与二知链反驳。 -/
theorem not_inward_via_knower_rescue
    (Inward SeesFace Outside ExternalRescue BodyAware TwoKnowers TwoBuddhas : Prop)
    (inward_requires_face : Inward → SeesFace)
    (face_requires_outside : SeesFace → Outside)
    (inward_outside_requires_rescue : Inward → Outside → ExternalRescue)
    (external_consequences : ExternalRescue → (¬ BodyAware) ∨ TwoKnowers)
    (body_aware : BodyAware)
    (two_knowers_entail_two_buddhas : TwoKnowers → TwoBuddhas)
    (not_two_buddhas : ¬ TwoBuddhas) : ¬ Inward := by
  intro inward
  have outside : Outside := face_requires_outside (inward_requires_face inward)
  have rescue : ExternalRescue := inward_outside_requires_rescue inward outside
  exact (not_external_knower_rescue ExternalRescue BodyAware TwoKnowers TwoBuddhas
    external_consequences body_aware two_knowers_entail_two_buddhas not_two_buddhas) rescue

/-- 暗室焦腑是独立补充：检验把暗直接当作内身的同一判据。 -/
theorem not_darkness_criterion
    (DarknessCriterion RoomIsViscera : Prop)
    (criterion_applies_to_room : DarknessCriterion → RoomIsViscera)
    (room_is_not_viscera : ¬ RoomIsViscera) : ¬ DarknessCriterion := by
  intro criterion
  exact room_is_not_viscera (criterion_applies_to_room criterion)

/-! ## 范围核对：真假取值只是逻辑见证，不是现实心的模型 -/

/-- 可见暗且根尘相对，同时满足普通分支前提，而不认定其为见内确证。 -/
theorem ordinary_premises_have_model :
    ∃ (Ordinary SeesDark FacesEye InnerEvidence : Prop),
      (Ordinary → SeesDark ∧ InnerEvidence) ∧ (SeesDark → FacesEye) ∧
      (FacesEye → ¬ InnerEvidence) ∧ SeesDark := by
  exact ⟨False, True, True, False, (fun h => False.elim h),
    (fun h => h), (fun _ h => h), True.intro⟩

/-- 去掉对眼与见内确证之间的连接，角色分类本身不足以排除原主张。 -/
theorem ordinary_without_evidence_bridge_allows_claim :
    ∃ (Ordinary SeesDark FacesEye InnerEvidence : Prop),
      (Ordinary → SeesDark ∧ InnerEvidence) ∧ (SeesDark → FacesEye) ∧ Ordinary := by
  exact ⟨True, True, True, True, (fun h => ⟨h, h⟩), (fun h => h), True.intro⟩

/-- 返观分支的三个前提并非自身矛盾。 -/
theorem inward_premises_have_model :
    ∃ (Inward SeesFace Outside : Prop),
      (Inward → SeesFace) ∧ (SeesFace → Outside) ∧ (Inward → ¬ Outside) := by
  exact ⟨False, False, False, (fun h => h), (fun h => h), (fun _ h => h)⟩

/-- 去掉开合返观的一致性连接，其余位置条件仍容许返观主张为真。 -/
theorem inward_without_face_bridge_allows_claim :
    ∃ (Inward SeesFace Outside : Prop),
      (SeesFace → Outside) ∧ (Inward → ¬ Outside) ∧ Inward := by
  exact ⟨True, False, False, (fun h => h), (fun _ h => h), True.intro⟩

/-- 身觉与二知分支的条件可以同时成立，并不预先断言矛盾。 -/
theorem knower_premises_have_model :
    ∃ (ExternalRescue BodyAware TwoKnowers TwoBuddhas : Prop),
      (ExternalRescue → (¬ BodyAware) ∨ TwoKnowers) ∧ BodyAware ∧
      (TwoKnowers → TwoBuddhas) ∧ ¬ TwoBuddhas := by
  exact ⟨False, True, False, False, (fun h => False.elim h), True.intro,
    (fun h => h), (fun h => h)⟩

/-- 若没有一身不成两佛这一限制，后果链自身不排除外置能知补救。 -/
theorem knower_without_terminal_limit_allows_rescue :
    ∃ (ExternalRescue BodyAware TwoKnowers TwoBuddhas : Prop),
      (ExternalRescue → (¬ BodyAware) ∨ TwoKnowers) ∧ BodyAware ∧
      (TwoKnowers → TwoBuddhas) ∧ ExternalRescue := by
  exact ⟨True, True, True, True, (fun h => Or.inr h), True.intro,
    (fun h => h), True.intro⟩

end Surangama.SevenLocations.C4
