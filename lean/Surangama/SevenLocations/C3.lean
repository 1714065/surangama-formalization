/- SPDX-License-Identifier: Apache-2.0 -/

/-!
# C3 · 七处征心第三处：“潜伏根里，如琉璃合”的条件反驳

经文提供指引，论证检查误认，Lean 核对明确前提下的推导；
这些工作的完成，不等于修证的完成。
可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

依据：《研究札记_潜伏根里_逻辑与论据_20260930》；
T19n0945 卷一 p107b22–c08。见 docs/C3_IN_ROOT_CONDITIONAL.md。
保留既有 L3 的简化分支，并补上“若见眼，不得成随”的分支及汇总。
所有连接条件单列为参数，不导入整套 SutraPremises。

命题的工作解释（不是对心或如来藏作本体定义）：
* InRoot：阿难本段的“了知心潜伏眼根里，如琉璃合”解释成立。
* SeesEye：在本段向外观看的方式下，心直接见到自己的眼根。
  不将照镜子、照片或医学影像混作同一种“见眼”。
  新分支将其限定为：像见山河一样，把所称的眼当作可见色境。
* FollowsSeeing：保持阿难原说的“根见而心随即分别”的所依关系。
  不是说心能产生任意一种分别，也不是给眼识的全部功能下定义。

两个明确前提：
* in_root_requires_seeing_eye：若上述潜根解释成立，就应见眼。
  比喻中的眼对应心，琉璃对应眼根。阿难承认“實見瑠璃”，
  佛陀追问“何不見眼”。这一类比迁移作为连接条件列出，
  不是 Lean 已经证明的光学规律，也没有写进 InRoot 的定义。
* no_seeing_eye：本段上述观看方式下不见眼。
  由“何不見眼”的反诘采用，不冒充阿难另答“我不见眼”。

新增两个明确前提：
* in_root_requires_following：潜根解释若成立，须保持随见随分别。
  对应 p107b27“彼根隨見隨即分別”。
* seeing_eye_prevents_following：若如此见眼，则不能保持上述关系。
  对应 p107c05“若見眼者，眼即同境，不得成隨”。
  这是按所依根与所缘色境有别而重建的连接条件，显式保留；
  不是“器官被观察后失去功能”，也不禁止意识认识眼根。

not_in_root_two_branches 使用“潜根则见眼”“潜根须成随”“见眼不成随”
三个条件，不再需要额外传入事实前提“不见眼”。
不见眼时由原简化定理反驳；见眼时由新增分支反驳。
汇总通过潜根假设自身要求的见眼进入见眼分支，无需排中律。
本文件核对条件推导，不证明类比或根境区分本身；
不据此否定所有眼根相关认知理论。
本 C3 不是旧项目的绳蛇推断模型。
-/

namespace Surangama.SevenLocations.C3

/-- 依此潜根解释应见眼；实际不见眼；故在这两个条件下该解释不成立。 -/
theorem not_in_root
    (InRoot SeesEye : Prop)
    (in_root_requires_seeing_eye : InRoot → SeesEye)
    (no_seeing_eye : ¬ SeesEye) :
    ¬ InRoot := by
  -- 暂时接下“潜根解释成立”的假设。
  intro in_root
  -- 把这一假设交给前提一，得到“见眼”的依据。
  have sees_eye : SeesEye := in_root_requires_seeing_eye in_root
  -- 前提二已是不见眼；把见眼的依据交给它，得到矛盾。
  exact no_seeing_eye sees_eye

/-! ## 新增分支与双分支汇总 -/

/-- 若承认见眼而眼同色境，则不成随；但潜根解释须成随，故该解释不成立。 -/
theorem not_in_root_of_seeing
    (InRoot SeesEye FollowsSeeing : Prop)
    (in_root_requires_following : InRoot → FollowsSeeing)
    (seeing_eye_prevents_following : SeesEye → ¬ FollowsSeeing)
    (sees_eye : SeesEye) :
    ¬ InRoot := by
  intro in_root
  -- 原模型要求保留根见、心随即分别。
  have follows : FollowsSeeing := in_root_requires_following in_root
  -- 见眼而眼同境，则不能保持同一所依关系。
  have not_follows : ¬ FollowsSeeing := seeing_eye_prevents_following sees_eye
  exact not_follows follows

/-- 不见眼违背类比；见眼不能成随。汇总不额外假定实际不见眼。 -/
theorem not_in_root_two_branches
    (InRoot SeesEye FollowsSeeing : Prop)
    (in_root_requires_seeing_eye : InRoot → SeesEye)
    (in_root_requires_following : InRoot → FollowsSeeing)
    (seeing_eye_prevents_following : SeesEye → ¬ FollowsSeeing) :
    ¬ InRoot := by
  intro in_root
  -- 若不见眼，前一个 not_in_root 已说明不能成立。
  -- 现在暂时接受潜根模型，它自己就要求见眼，无需另作二分假设。
  have sees_eye : SeesEye := in_root_requires_seeing_eye in_root
  -- 进入见眼分支：模型同时要求成随，而见眼又推出不成随。
  exact (not_in_root_of_seeing InRoot SeesEye FollowsSeeing
    in_root_requires_following seeing_eye_prevents_following sees_eye) in_root

/-! ## 原简化分支的范围核对：仅为逻辑真假取值 -/

/-- 潜根解释为假、见眼为假，两个前提可以同时成立。 -/
theorem premises_have_model :
    ∃ (InRoot SeesEye : Prop), (InRoot → SeesEye) ∧ ¬ SeesEye := by
  exact ⟨False, False, (fun h => h), (fun h => h)⟩

/-- 只保留不见眼，仍容许潜根解释为真，故连接条件不能省去。 -/
theorem without_bridge_allows_in_root :
    ∃ (InRoot SeesEye : Prop), (¬ SeesEye) ∧ InRoot := by
  exact ⟨True, False, (fun h => h), True.intro⟩

/-- 只保留潜根则见眼，仍容许潜根解释为真，故不见眼条件不能省去。 -/
theorem without_no_seeing_eye_allows_in_root :
    ∃ (InRoot SeesEye : Prop), (InRoot → SeesEye) ∧ InRoot := by
  exact ⟨True, True, (fun h => h), True.intro⟩

/-! ## 双分支汇总的范围核对：不把三条前提本身设为互相矛盾 -/

/-- 潜根为假、见眼为假、成随为真，可以同时满足三个条件。 -/
theorem two_branch_premises_have_model :
    ∃ (InRoot SeesEye FollowsSeeing : Prop),
      (InRoot → SeesEye) ∧ (InRoot → FollowsSeeing) ∧
      (SeesEye → ¬ FollowsSeeing) := by
  exact ⟨False, False, True, (fun h => h),
    (fun h => False.elim h), (fun h => False.elim h)⟩

/-- 去掉潜根则见眼，潜根为真、见眼为假、成随为真仍满足其余条件。 -/
theorem two_branch_without_bridge_allows_in_root :
    ∃ (InRoot SeesEye FollowsSeeing : Prop),
      (InRoot → FollowsSeeing) ∧ (SeesEye → ¬ FollowsSeeing) ∧ InRoot := by
  exact ⟨True, False, True, (fun h => h), (fun h => False.elim h), True.intro⟩

/-- 去掉潜根须成随，潜根为真、见眼为真、成随为假仍满足其余条件。 -/
theorem two_branch_without_following_allows_in_root :
    ∃ (InRoot SeesEye FollowsSeeing : Prop),
      (InRoot → SeesEye) ∧ (SeesEye → ¬ FollowsSeeing) ∧ InRoot := by
  exact ⟨True, True, False, (fun h => h), (fun _ h => h), True.intro⟩

/-- 去掉见眼不成随，三个命题都为真仍满足其余条件。 -/
theorem two_branch_without_incompatibility_allows_in_root :
    ∃ (InRoot SeesEye FollowsSeeing : Prop),
      (InRoot → SeesEye) ∧ (InRoot → FollowsSeeing) ∧ InRoot := by
  exact ⟨True, True, True, (fun h => h), (fun h => h), True.intro⟩

end Surangama.SevenLocations.C3
