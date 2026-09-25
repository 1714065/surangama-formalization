/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# The seven-location argument (七處徵心 / 七番破處), Śūraṅgama Sūtra, fascicle 1

Machine-checked reconstruction of the dialogue in which Ānanda proposes seven
locations for the "aware-knowing mind" (覺了能知之心) and the Buddha rejects
each.  Reading `R1`: the mind under discussion is the object-directed
cognizing mind (識心 / 攀緣心) that the commentaries take the passage to be
refuting, not the "seeing-essence" (見精) displayed later in the text.

Premises are fields of `SutraPremises`, never global axioms, so that the same
theorems can be evaluated against alternative premise sets and finite models
(see `Countermodels.lean`).  Each field names the premise Ānanda accepts in the
dialogue or the project's own formal restatement of it; the correspondence is
recorded, premise by premise, in `docs/STATUS.md`.

Nothing here shows that the sutra is true, that the premises are true, or that
this reading is the only one.  The theorems say: under `SutraPremises`, each of
the seven candidate locations is refuted.
-/

namespace Surangama.SevenLocations

/-- The seven candidate locations, in the order of the dialogue. -/
inductive Place
  | inside      -- H1 心在身內
  | outside     -- H2 心在身外
  | inRoot      -- H3 潛伏根裡
  | darkInside  -- H4 閉眼見暗即見內（藏暗竅明）
  | onContact   -- H5 隨所合處心則隨有
  | between     -- H6 心在根塵中間
  | nowhere     -- H7 一切無著名之為心
  deriving DecidableEq, Repr

/-- A world: a carrier of objects, the distinguished objects the dialogue
mentions, and the predicates the dialogue uses.  No premise is built in. -/
structure World where
  Obj : Type
  mind : Obj                     -- 覺了能知之心（reading R1: 識心）
  viscera : Obj                  -- 心肝脾胃
  eye : Obj                      -- 眼根（浮塵根）
  darkness : Obj                 -- 閉眼所見之暗
  Loc : Obj → Place → Prop       -- Loc o p : o is located at p
  Sees : Obj → Obj → Prop        -- Sees m o : m sees o (fine-grained perception)
  Coupled : Obj → Prop           -- 身心相知 : m and the body know each other
  HasBody : Obj → Prop           -- 有體
  OneBody : Obj → Prop           -- 一體
  ManyBody : Obj → Prop          -- 多體
  FacesEye : Obj → Prop          -- 與眼相對
  InsideBody : Obj → Prop        -- 在身內
  Mixed : Obj → Prop             -- 兼二（兼根之有知與塵之無知）
  IsNothing : Obj → Prop         -- 無（同龜毛兔角）
  HasForm : Obj → Prop           -- 有相

/-- The premises accepted in the dialogue under reading `R1`, one field each.
Locators (圓瑛《講義》extraction line numbers `L…`; CBETA T19n0945 column
locators are recorded in `docs/STATUS.md` where verified). -/
structure SutraPremises (w : World) : Prop where
  /-- A01 內見原則: if the mind is inside the body it should first see the viscera (L553). -/
  A01 : w.Loc w.mind .inside → w.Sees w.mind w.viscera
  /-- A02 人不見臟腑 (L536). -/
  A02 : ¬ w.Sees w.mind w.viscera
  /-- A03 身心相知 (L589). -/
  A03 : w.Coupled w.mind
  /-- A04 異體不互知: if the mind were outside, body and mind would not know each other (L585). -/
  A04 : w.Loc w.mind .outside → ¬ w.Coupled w.mind
  /-- A05 眼前之物可見: if the mind lay in the eye like glass on the eye it would see the eye (L621–L625). -/
  A05 : w.Loc w.mind .inRoot → w.Sees w.mind w.eye
  /-- A06 見景不見眼 (L625). -/
  A06 : ¬ w.Sees w.mind w.eye
  /-- A07a content of H4: "in the dark inside" means seeing darkness and the darkness being inside the body (L643). Project restatement. -/
  A07a : w.Loc w.mind .darkInside → w.Sees w.mind w.darkness ∧ w.InsideBody w.darkness
  /-- A07b 對眼原則之一: if the darkness faces the eye it is in front of the eye, not inside (L655). -/
  A07b : w.FacesEye w.darkness → ¬ w.InsideBody w.darkness
  /-- A07c 對眼原則之二, in the text's own contrapositive form: if the darkness does not face the eye, no seeing occurs (L655). -/
  A07c : ¬ w.FacesEye w.darkness → ¬ w.Sees w.mind w.darkness
  /-- A08 無體不合: being located by combining requires having a body (L694). -/
  A08 : w.Loc w.mind .onContact → w.HasBody w.mind
  /-- A09a having a body, it is one body or many (L706). -/
  A09a : w.HasBody w.mind → w.OneBody w.mind ∨ w.ManyBody w.mind
  /-- A09b one body fails (L706–L718). -/
  A09b : ¬ w.OneBody w.mind
  /-- A09c many bodies fail (L706–L718). -/
  A09c : ¬ w.ManyBody w.mind
  /-- A10a 兼二不成 (L757–L769). -/
  A10a : ¬ w.Mixed w.mind
  /-- A10b 不兼二則無體 (L769). -/
  A10b : w.Loc w.mind .between → ¬ w.Mixed w.mind → ¬ w.HasBody w.mind
  /-- A10c 在中間須有體可指 (L769). -/
  A10c : w.Loc w.mind .between → w.HasBody w.mind
  /-- A11a "unattached" is either nothing or something with a form (L784). -/
  A11a : w.Loc w.mind .nowhere → w.IsNothing w.mind ∨ w.HasForm w.mind
  /-- A11b the mind is not nothing (L791). -/
  A11b : ¬ w.IsNothing w.mind
  /-- A11c 相有則在: what has a form is somewhere among the first six places (L791). Project restatement. -/
  A11c : w.HasForm w.mind → ∃ p, p ≠ Place.nowhere ∧ w.Loc w.mind p

variable {w : World}

/-! ## The seven refutations -/

theorem L1 (h : SutraPremises w) : ¬ w.Loc w.mind .inside :=
  fun hin => h.A02 (h.A01 hin)

theorem L2 (h : SutraPremises w) : ¬ w.Loc w.mind .outside :=
  fun hin => h.A04 hin h.A03

theorem L3 (h : SutraPremises w) : ¬ w.Loc w.mind .inRoot :=
  fun hin => h.A06 (h.A05 hin)

/-- H4 as the text argues it: a dilemma on whether the darkness faces the eye.
This proof uses excluded middle; see `L4_of_forward` for the constructive route. -/
theorem L4 (h : SutraPremises w) : ¬ w.Loc w.mind .darkInside := by
  intro hin
  obtain ⟨hs, hi⟩ := h.A07a hin
  by_cases hf : w.FacesEye w.darkness
  · exact h.A07b hf hi
  · exact h.A07c hf hs

/-- With the forward form of A07c (seeing darkness → it faces the eye), no case
split is needed.  The forward form is classically equivalent to A07c but only
weaker constructively; the dependency reports of `L4` and `L4_of_forward`
differ exactly by the classical axioms. -/
theorem L4_of_forward (h : SutraPremises w)
    (A07c' : w.Sees w.mind w.darkness → w.FacesEye w.darkness) :
    ¬ w.Loc w.mind .darkInside := by
  intro hin
  obtain ⟨hs, hi⟩ := h.A07a hin
  exact h.A07b (A07c' hs) hi

theorem no_body (h : SutraPremises w) : ¬ w.HasBody w.mind :=
  fun hb => (h.A09a hb).elim h.A09b h.A09c

theorem L5 (h : SutraPremises w) : ¬ w.Loc w.mind .onContact :=
  fun hin => no_body h (h.A08 hin)

/-- H6 along the text's route (兼二 / 不兼二). -/
theorem L6 (h : SutraPremises w) : ¬ w.Loc w.mind .between :=
  fun hin => (h.A10b hin h.A10a) (h.A10c hin)

/-- H6 by the shortcut through `no_body`: the same conclusion from a different
subset of premises (the 兼二 dilemma A10a/A10b is not used). -/
theorem L6_shortcut (h : SutraPremises w) : ¬ w.Loc w.mind .between :=
  fun hin => no_body h (h.A10c hin)

theorem L7 (h : SutraPremises w) : ¬ w.Loc w.mind .nowhere := by
  intro hin
  rcases h.A11a hin with hn | hf
  · exact h.A11b hn
  · obtain ⟨p, hp, hl⟩ := h.A11c hf
    cases p with
    | inside     => exact L1 h hl
    | outside    => exact L2 h hl
    | inRoot     => exact L3 h hl
    | darkInside => exact L4 h hl
    | onContact  => exact L5 h hl
    | between    => exact L6 h hl
    | nowhere    => exact hp rfl

/-! ## Main statement: none of the seven candidates holds -/

theorem seven_refutations (h : SutraPremises w) : ∀ p : Place, ¬ w.Loc w.mind p := by
  intro p
  cases p with
  | inside     => exact L1 h
  | outside    => exact L2 h
  | inRoot     => exact L3 h
  | darkInside => exact L4 h
  | onContact  => exact L5 h
  | between    => exact L6 h
  | nowhere    => exact L7 h

theorem no_candidate_place (h : SutraPremises w) : ¬ ∃ p, w.Loc w.mind p :=
  fun ⟨p, hp⟩ => seven_refutations h p hp

end Surangama.SevenLocations
