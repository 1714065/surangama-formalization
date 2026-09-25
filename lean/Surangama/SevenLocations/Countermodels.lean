/- SPDX-License-Identifier: Apache-2.0 -/

import Surangama.SevenLocations.Core

/-!
# Finite models for the seven-location argument

Three finite models, each answering one question that the theorems in
`Core.lean` cannot answer by themselves.

1. `emptyWorld`: the nineteen premises of `SutraPremises` are jointly
   satisfiable.  The refutation is therefore not an artefact of an inconsistent
   premise set.
2. `brainWorld`: under a channel-principle theory of perception
   (`ModernPremises`: seeing requires a sensory channel, and the viscera have
   none), there is a world in which the mind is inside the body.  So the
   refutation of H1 is not derivable from `ModernPremises`; it depends on the
   presence-principle premise A01.
3. `twoMinds`: a world containing two distinct objects, one satisfying the
   sutra premises (and hence located nowhere among the candidates) and one
   satisfying a "field" theory (located everywhere, discerning everything in
   the field).  The three premise sets are jointly satisfiable once the word
   "mind" is allowed to name two objects.
-/

namespace Surangama.SevenLocations

/-! ## 1. The sutra premises are satisfiable -/

/-- A world in which nothing is located anywhere, nothing sees anything, and
the mind is coupled to the body.  Every field of `SutraPremises` holds. -/
def emptyWorld : World :=
  { Obj := Bool
    mind := true
    viscera := false
    eye := false
    darkness := false
    Loc := fun _ _ => False
    Sees := fun _ _ => False
    Coupled := fun _ => True
    HasBody := fun _ => False
    OneBody := fun _ => False
    ManyBody := fun _ => False
    FacesEye := fun _ => False
    InsideBody := fun _ => False
    Mixed := fun _ => False
    IsNothing := fun _ => False
    HasForm := fun _ => False }

theorem emptyWorld_premises : SutraPremises emptyWorld where
  A01 := fun h => h.elim
  A02 := fun h => h
  A03 := trivial
  A04 := fun h => h.elim
  A05 := fun h => h.elim
  A06 := fun h => h
  A07a := fun h => h.elim
  A07b := fun h => h.elim
  A07c := fun _ h => h
  A08 := fun h => h.elim
  A09a := fun h => h.elim
  A09b := fun h => h
  A09c := fun h => h
  A10a := fun h => h
  A10b := fun h => h.elim
  A10c := fun h => h.elim
  A11a := fun h => h.elim
  A11b := fun h => h
  A11c := fun h => h.elim

theorem sutra_premises_satisfiable : ∃ w : World, SutraPremises w :=
  ⟨emptyWorld, emptyWorld_premises⟩

/-! ## 2. Under a channel principle, H1 is not refuted -/

/-- A world with a channel predicate: `HasChannel o` says a fine-grained sensory
channel reaches `o`. -/
structure ChannelWorld extends World where
  HasChannel : Obj → Prop

/-- Modern (channel-principle) premises: seeing needs a channel; the viscera have
no fine-grained channel; the viscera are not seen. -/
structure ModernPremises (w : ChannelWorld) : Prop where
  seeing_needs_channel : ∀ o, w.Sees w.mind o → w.HasChannel o
  viscera_no_channel : ¬ w.HasChannel w.viscera
  viscera_not_seen : ¬ w.Sees w.mind w.viscera

/-- The mind is inside the body; nothing is seen; no channel reaches anything. -/
def brainWorld : ChannelWorld :=
  { Obj := Bool
    mind := true
    viscera := false
    eye := false
    darkness := false
    Loc := fun o p => o = true ∧ p = Place.inside
    Sees := fun _ _ => False
    Coupled := fun _ => True
    HasBody := fun _ => False
    OneBody := fun _ => False
    ManyBody := fun _ => False
    FacesEye := fun _ => False
    InsideBody := fun _ => False
    Mixed := fun _ => False
    IsNothing := fun _ => False
    HasForm := fun _ => False
    HasChannel := fun _ => False }

theorem brainWorld_modern : ModernPremises brainWorld where
  seeing_needs_channel := fun _ h => h.elim
  viscera_no_channel := fun h => h
  viscera_not_seen := fun h => h

theorem brainWorld_mind_inside : brainWorld.Loc brainWorld.mind Place.inside :=
  ⟨rfl, rfl⟩

/-- There is no proof that `ModernPremises` refute H1 for every world. -/
theorem H1_not_refuted_by_modern :
    ¬ (∀ w : ChannelWorld, ModernPremises w → ¬ w.Loc w.mind Place.inside) :=
  fun hall => hall brainWorld brainWorld_modern brainWorld_mind_inside

/-- `brainWorld` violates A01: this is the premise the two theories disagree on. -/
theorem brainWorld_violates_A01 :
    ¬ (brainWorld.Loc brainWorld.mind Place.inside →
        brainWorld.Sees brainWorld.mind brainWorld.viscera) :=
  fun h => h brainWorld_mind_inside

/-! ## 3. Two objects named "mind" -/

/-- A world with a second distinguished object `a` and a coarse discernment
predicate `Knows`, plus a field-membership predicate. -/
structure TwoObjectWorld extends World where
  a : Obj                       -- 見精 / 覺 (reading R2)
  Knows : Obj → Obj → Prop      -- coarse discernment (了知), distinct from `Sees`
  InField : Obj → Prop          -- membership in the "field"

/-- Field premises about `a`: everything in the field is discerned by `a`; the
viscera are in the field; `a` is located at every place. -/
structure FieldPremises (w : TwoObjectWorld) : Prop where
  discerns_field : ∀ o, w.InField o → w.Knows w.a o
  viscera_in_field : w.InField w.viscera
  everywhere : ∀ p, w.Loc w.a p

inductive M
  | c   -- 攀緣心
  | a   -- 見精
  | v   -- 臟腑
  deriving DecidableEq, Repr

def twoMinds : TwoObjectWorld :=
  { Obj := M
    mind := M.c
    a := M.a
    viscera := M.v
    eye := M.v
    darkness := M.v
    Loc := fun o _ => o = M.a
    Sees := fun _ _ => False
    Knows := fun o _ => o = M.a
    InField := fun _ => True
    Coupled := fun _ => True
    HasBody := fun _ => False
    OneBody := fun _ => False
    ManyBody := fun _ => False
    FacesEye := fun _ => False
    InsideBody := fun _ => False
    Mixed := fun _ => False
    IsNothing := fun _ => False
    HasForm := fun _ => False }

theorem twoMinds_sutra : SutraPremises twoMinds.toWorld where
  A01 := fun h => M.noConfusion h
  A02 := fun h => h
  A03 := trivial
  A04 := fun h => M.noConfusion h
  A05 := fun h => M.noConfusion h
  A06 := fun h => h
  A07a := fun h => M.noConfusion h
  A07b := fun h => h.elim
  A07c := fun _ h => h
  A08 := fun h => M.noConfusion h
  A09a := fun h => h.elim
  A09b := fun h => h
  A09c := fun h => h
  A10a := fun h => h
  A10b := fun h => M.noConfusion h
  A10c := fun h => M.noConfusion h
  A11a := fun h => M.noConfusion h
  A11b := fun h => h
  A11c := fun h => h.elim

theorem twoMinds_field : FieldPremises twoMinds where
  discerns_field := fun _ _ => rfl
  viscera_in_field := trivial
  everywhere := fun _ => rfl

/-- The same sentence "the mind is inside the body" is false of `c` and true of
`a` in one and the same world. -/
theorem key_difference :
    ¬ twoMinds.Loc twoMinds.mind Place.inside ∧ twoMinds.Loc twoMinds.a Place.inside :=
  ⟨L1 twoMinds_sutra, twoMinds_field.everywhere Place.inside⟩

theorem sutra_and_field_compatible :
    ∃ w : TwoObjectWorld, SutraPremises w.toWorld ∧ FieldPremises w :=
  ⟨twoMinds, twoMinds_sutra, twoMinds_field⟩

end Surangama.SevenLocations
