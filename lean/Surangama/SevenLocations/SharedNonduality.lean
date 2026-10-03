/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# Shared nonduality reading: conditional exclusion of reified identification

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认佛、如来藏是什么。

This additional interpretive layer does not replace the published C1-C7 proofs.
It neither imports them nor identifies their target predicates with its own.
See docs/SHARED_NONDUALITY.md for the passage-by-passage reading and sources.

Description i: the selected contextual account of a candidate mind holds.
Separated i: that account reifies the knower as a separately subsisting entity
over against its objects. This is not mere functional distinction or location.
Identifies i: the candidate is correctly identified as the mind-nature sought
in this dialogue. This predicate supplies no positive ontological definition.

Common exclusion: Separated i -> not Identifies i, an EXPLICIT interpretive
assumption, not a demonstrated metaphysical fact or a global axiom.
Seven bridges: Description i -> Separated i, individually exposed below.
The conclusion is not (Description i and Identifies i), NOT not Description i.
No causal-independence assumption, mind/object equality or spatial metric is used.
-/

namespace Surangama.SevenLocations.SharedNonduality

inductive Chapter where
  | c1 | c2 | c3 | c4 | c5 | c6 | c7
  deriving DecidableEq, Repr

/-- Textual/interpretive commitments, not consequences of the chapter names. -/
structure PassageBridges (Description Separated : Chapter → Prop) : Prop where
  c1 : Description .c1 → Separated .c1
  c2 : Description .c2 → Separated .c2
  c3 : Description .c3 → Separated .c3
  c4 : Description .c4 → Separated .c4
  c5 : Description .c5 → Separated .c5
  c6 : Description .c6 → Separated .c6
  c7 : Description .c7 → Separated .c7

/-- Case coverage is proved; the content of each bridge remains assumed. -/
theorem bridge_for_each (Description Separated : Chapter → Prop)
    (bridges : PassageBridges Description Separated) :
    ∀ i, Description i → Separated i := by
  intro i
  cases i with
  | c1 => exact bridges.c1
  | c2 => exact bridges.c2
  | c3 => exact bridges.c3
  | c4 => exact bridges.c4
  | c5 => exact bridges.c5
  | c6 => exact bridges.c6
  | c7 => exact bridges.c7

/-- The shared logical step, with its two substantive conditions visible. -/
theorem exclude_identification (Description Separated Identifies : Prop)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) :
    ¬ (Description ∧ Identifies) := by
  intro claim
  have separated : Separated := bridge claim.1
  exact common_exclusion separated claim.2

/-- One common exclusion schema plus seven bridges; no original local premise bundle. -/
theorem seven_identifications_refuted
    (Description Separated Identifies : Chapter → Prop)
    (common_exclusion : ∀ i, Separated i → ¬ Identifies i)
    (bridges : PassageBridges Description Separated) :
    ∀ i, ¬ (Description i ∧ Identifies i) := by
  intro i
  exact exclude_identification (Description i) (Separated i) (Identifies i)
    (common_exclusion i) (bridge_for_each Description Separated bridges i)

/-- To transfer to any separately named Claim, its contextual content must be supplied.
This file does not automatically instantiate the old C1-C7 Claim predicates. -/
theorem refute_contextual_claim (Claim Description Separated Identifies : Prop)
    (claim_content : Claim → Description ∧ Identifies)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) : ¬ Claim := by
  intro claim
  exact exclude_identification Description Separated Identifies
    common_exclusion bridge (claim_content claim)

/-- All descriptions may hold while the two premise families remain consistent. -/
theorem premises_have_model_with_descriptions :
    ∃ (Description Separated Identifies : Chapter → Prop),
      (∀ i, Separated i → ¬ Identifies i) ∧
      PassageBridges Description Separated ∧ (∀ i, Description i) := by
  refine ⟨(fun _ => True), (fun _ => True), (fun _ => False), ?_, ?_, ?_⟩
  · intro i separated identified
    exact identified
  · exact ⟨(fun h => h), (fun h => h), (fun h => h), (fun h => h),
      (fun h => h), (fun h => h), (fun h => h)⟩
  · intro i
    exact True.intro

/-- Without common exclusion, all seven bridges permit all seven identifications. -/
theorem without_common_exclusion :
    ∃ (Description Separated Identifies : Chapter → Prop),
      PassageBridges Description Separated ∧
      (∀ i, Description i ∧ Identifies i) := by
  refine ⟨(fun _ => True), (fun _ => True), (fun _ => True), ?_, ?_⟩
  · exact ⟨(fun h => h), (fun h => h), (fun h => h), (fun h => h),
      (fun h => h), (fun h => h), (fun h => h)⟩
  · intro i
    exact ⟨True.intro, True.intro⟩

/-- Missing even one bridge leaves that chapter's identification possible.
The other six bridges and the common principle are retained. -/
theorem without_one_bridge (j : Chapter) :
    ∃ (Description Separated Identifies : Chapter → Prop),
      (∀ i, Separated i → ¬ Identifies i) ∧
      (∀ i, i ≠ j → Description i → Separated i) ∧
      (Description j ∧ Identifies j) := by
  refine ⟨(fun i => i = j), (fun _ => False), (fun _ => True), ?_, ?_, rfl, True.intro⟩
  · intro i separated
    exact False.elim separated
  · intro i different described
    exact different described

/-- Rejecting the identification does not by itself refute the description. -/
theorem description_can_remain :
    ∃ (Description Separated Identifies : Prop),
      (Separated → ¬ Identifies) ∧ (Description → Separated) ∧
      Description ∧ ¬ (Description ∧ Identifies) := by
  exact ⟨True, True, False, (fun _ h => h), (fun h => h), True.intro,
    (fun h => h.2)⟩

end Surangama.SevenLocations.SharedNonduality
