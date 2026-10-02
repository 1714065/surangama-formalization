/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# 心不在内：两个明确前提下的条件推导

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

This is a teaching version of the implication pattern used by `L1`.
It does not import the seven-location premise bundle or define a mind object.

Working interpretation (not definitions of an ultimate reality):
* `Inside`: 阿难本段所执的识心住在身内。
* `KnowsInside`: 具备本段要求的对身内的直接明了。
  This does not mean any bodily sensation or learned anatomical knowledge.
* `inside_requires_inner_knowing`: 在内应知内，作为本次重建的明确条件。
* `no_inner_knowing`: 不具备上述身内明了，作为对话中的经验前提。

Sources: T19n0945, fascicle 1, p107a19–b11; see
`docs/INSIDE_CONDITIONAL.md`. The lamp analogy is spoken by Ānanda after
the first refutation, when he proposes an outside location. It supports
attributing acceptance of the analogy at that stage, not an original
explicit premise or a universal theory of cognition.

The proof abstracts away temporal order in “先”, the detailed concession
“纵不能见…”, and the later objection “见是其眼，心知非眼” (p108a04).
It neither establishes its textual interpretation nor adjudicates brain-based
accounts of consciousness. All assumptions below are theorem parameters.
-/

namespace Surangama.SevenLocations.InsideConditional

/-- 接受“在内应知内”和“不知内”这两个条件，就不能同时坚持“在内”。 -/
theorem not_inside
    (Inside KnowsInside : Prop)
    (inside_requires_inner_knowing : Inside → KnowsInside)
    (no_inner_knowing : ¬ KnowsInside) :
    ¬ Inside := by
  -- 暂时假设阿难的身内定位成立。
  intro inside
  -- 使用第一个前提，得到“知内”的证明。
  have knows_inside : KnowsInside := inside_requires_inner_knowing inside
  -- 与第二个前提“不知内”相冲突，排除刚才的临时假设。
  exact no_inner_knowing knows_inside

/-! ## Scope witnesses: logical valuations, not empirical models of minds -/

/-- 两个前提可以同时满足；没有用互相矛盾的前提推出任意结论。 -/
theorem premises_have_model :
    ∃ (Inside KnowsInside : Prop),
      (Inside → KnowsInside) ∧ ¬ KnowsInside := by
  exact ⟨False, False, (fun h => h), (fun h => h)⟩

/-- 只留下“不知内”，仍容许“在内”为真：连接前提不可直接省去。 -/
theorem without_bridge_allows_inside :
    ∃ (Inside KnowsInside : Prop), (¬ KnowsInside) ∧ Inside := by
  exact ⟨True, False, (fun h => h), True.intro⟩

/-- 只留下“在内应知内”，仍容许“在内”为真：经验前提也不可省去。 -/
theorem without_no_inner_knowing_allows_inside :
    ∃ (Inside KnowsInside : Prop), (Inside → KnowsInside) ∧ Inside := by
  exact ⟨True, True, (fun h => h), True.intro⟩

end Surangama.SevenLocations.InsideConditional
