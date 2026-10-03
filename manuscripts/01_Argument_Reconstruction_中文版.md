# 基于 Lean 的《楞严经》论证重建

## 七处征心的论证前提与解释框架

**Jason Wu** · ORCID：[0009-0003-1682-6165](https://orcid.org/0009-0003-1682-6165)  
研究论文预印本 · v1.0 · 2026年10月4日

**英文题目：Reconstructing Arguments in the Śūraṅgama Sūtra with Lean: Premises and an Interpretive Framework for the Seven Locations of Mind**

*完整中文对照稿。章节编号、表格编号、逻辑式、代码和文献序号与整理后的英文稿对应，供作者逐段审阅。*

### 摘要

宗教经典中的推理常分散在对话、譬喻与注疏之中。因此，论证重建既要说明推导是否有效，也要交代哪些解释上的选择提供了所需前提。本文以中文《楞严经》七处征心为例，介绍一项 Lean 4 形式化研究。第一层由七个局部模块组成，将选定的反驳路线重建为条件证明，并将教义和解释上的承诺写成显式参数。第二层考察一种拟议的共同读法：七种主张把一个与所知对象相对、被另行设立的能知者，误认成对话所寻求的心性。这一读法由一个共同排除模式和七条逐段连接条件表示。Lean 验证在这些条件下，能否排除各段相应的心性认定；它不证明共同原则及连接条件本身就是文本事实。前提可满足的见证与删除前提后的反模型，使这些假设如何支撑结论变得可检查。局部语料包含49个定理声明，共同层新增8个，其中包括用于说明证明范围的见证。本文的主要贡献，是提供一种可复核的方法，区分逐段重建、统摄性的解释，以及二者各自需要履行的证明义务。这个案例说明，证明助手能够澄清一种共同解释所需付出的逻辑代价，而不把教义解读变成无条件的数学结论。

**关键词：**《楞严经》；Lean 4；论证重建；计算诠释学；汉传佛教；显式前提；不二

### 1. 研究问题

当宗教经典的若干段落被认为表达了一个共同旨趣时，怎样才算严格地评估了这种解释？主题上的相似还不够。另一方面，如果把希望得到的结论直接写进前提，形式证明也可以变得轻而易举。因此，方法上的问题是：如何把一种拟议解读与它声称能够解释的具体段落之间的步骤揭示出来。

通常称为“七處徵心”的七种心之处所主张，提供了一个规模适中的案例。在《楞严经》卷一中，阿难依次把心描述为在身内、在身外、潜伏根里、由见暗而显示见内、随相合处而有、在中间，以及无著或无所在。这些问答的表面形式并不相同：其中有譬喻、追问、感知功能的区别，以及从所提模型引出的后果。[1]

本文提出两个问题。第一，哪些前提足以支撑选定的局部反驳，重建者又在何处补充了未明说的连接？第二，一种拟议的共同解释，能否在不隐藏逐段假设的情况下，支持七个平行的结论？

本文尝试用一个共同问题来理解七处征心：**阿难虽然不断改变对心的说法，却是否始终认为，有一个与所知境界分开的能知者，而这个能知者就是真实的自心？** 本文要检查的，是这种认定能否成立。这一解释需要经文与注疏的支持，也需要逐段说明理由。研究既不提供关于佛或如来藏的本体论，也不提供关于证悟的形式理论。它的方法承诺是：经文指引、论证批判、机器核验与宗教修学，分别承担不同的任务。

### 2. 在计算诠释学中的位置

借助逻辑澄清哲学论证，已经是一条既有的研究方向。Fuenmayor 与 Benzmüller 将计算诠释学描述为一种迭代活动：一方面评估形式推导是否正确，另一方面评估某种解释在论辩中的作用。他们的研究为根据解释上的讨论修订形式化方案，提供了相关先例。[2]

Lean 4 同时是一种编程语言和交互式定理证明器。本文用它检查明确陈述的条件命题所对应的证明项。[3] 本项目证明所用的逻辑是初等的。研究没有引入新的逻辑演算，也没有提出困难的数学定理；其贡献是一项有记录可查的应用，使文本证据、解释连接、证明核验和反模型能够分别接受检查。

本案例设计有三个特点。首先，语料规模足够小，可以逐段交代解释责任。其次，两层形式化保留了局部反驳与主题统摄之间的差别。最后，成功证明还附有见证，说明前提允许哪些情况，以及删除某些前提后会发生什么。这些安排支持对解释的批评，而不是向解释者颁发教义正确的证书。

### 3. 语料、注疏与证据地位

基本文本是中文《大正藏》T19、第945号《楞严经》卷一。七段问答大致位于0107a12—0108b14。引文保留繁体字；英文稿中的翻译与转述是作者的工作性译文。行号依据项目保存的 CBETA 转录本。本文讨论的是这部中文经典的论证，不处理其历史成书或归属问题。[1]

开篇「將何所見？誰為愛樂？」先问见与爱乐，随后才问心目所在，见0107a04—11。后文关于二种根本及依尘分别的讨论，进一步提供了解释语境，见0108b28—0108c08、0109a07—15。后文可以启发对整个序列的理解，但不能被悄悄插入每次此前问答，充当双方早已接受的前提。

共同读法的主要注疏依据来自蕅益智旭和太虚。蕅益在解释 C7 时指出，将缘影认作心，仍会留下一个另立之物，即便没有给它固定位置。太虚则把错误说明为将名言所生尘影认作自心。这些解释为区分“没有位置”和“不再实体化”提供了相关依据。[4, 5]

其他注疏的侧重也应保留。憨山德清把七处问答联系到对蕴的执著，以及身体作为心之所依的理解。项目所用的现代成观法师注释，则从能所执著讨论开篇见与爱乐的问答。这些读法帮助我们确定研究方向，但不意味着所有注家一致接受本文所使用的精确形式模式。[6, 7]

证据分为四层记录：经文措辞、具名注家的解释、研究者的重建，以及明确写出的形式假设。任何说法从一层转到另一层，都需要说明理由。尤其是，一部注疏支持某个一般主题，并不等于它证明了在这个主题下引入的每一条数学蕴含。

### 4. 局部条件重建

#### 4.1 为什么把前提写成参数

每个局部模块用命题表示选定的主张及相关后果。例如，“如果所讨论的候选心在身内，就必须了知身体内部”这一连接，以假设的形式提供。Lean 再检查拟议结论能否由此推出。这个连接不会被声明为全局性的宗教公理。

C1 的逻辑形式特别简单。令 `Inside` 表示被检查的在内主张，`KnowsInside` 表示其所要求的了知内部。从 `Inside → KnowsInside` 和 `¬ KnowsInside` 推出 `¬ Inside`。关键的经文解释工作在第一条前提：为什么这个模型应当要求了知内部？在本文的重建中，讲堂譬喻及对能知心的描述为这一要求提供理由。条件推导成立，并不证明一切可能位于身内的认知过程，都必须能够查看内脏。

C2 也需要保持这个区别。选定的读法将身外之心与身心不能相知联系起来，再用被承认的身心相知反对该模型。它没有建立一条物理学普遍定律，声称空间上分开的系统不能互相作用。

#### 4.2 七个模块的覆盖范围

表1概括选定的主要路线。一个模块可以包含补充引理和其他分支，而不必把经文的每一句都放进主定理。声明计数既包括反驳，也包括用于说明范围的见证。

| 模块 | 选定的候选或主张 | 需要解释的主要连接或分类 | 声明数 |
|:--|:--|:--|--:|
| C1, Inside | 能知之心在身体内部 | 在内就要求了知内部 | 4 |
| C2, Outside | 能知之心在身体外部 | 在这个模型中，在外使身心不能相知 | 4 |
| C3, InRoot | 心潜藏在感官之根中 | 瑠璃譬喻要求见眼；把眼当成所见，与所主张的随见关系冲突 | 10 |
| C4, LightAndDarkness | 见暗能够确立见内 | 区分通常的见与返观；用能否见面检查所主张的返观 | 17 |
| C5, AtContact | 心在相合之处存在 | 相合需要有所指；对有体的接触模型，分内出与外入检查 | 5 |
| C6, Middle | 心是根尘之间可独立指认的中间 | 区分兼两边、只属一边及两边都不属 | 6 |
| C7, Unlocated | 存在一个能知的心，但它没有所在之处 | 在这个模型中，有确定体相就意味着有所处 | 3 |

**表1。** 选定的局部重建，共49个声明；不是关于经文的49项独立发现。模块标签是源文件名的简写，例如“C4, LightAndDarkness”对应 `C4_LightAndDarkness.lean`。

#### 4.3 怎样阅读 Lean 证明：七个简短例子

以下摘录取自已经核验的 C1—C7 文件，位于 `lean/Surangama/SevenLocations/`。仅省略整行注释，可执行语句及名称保持原样。C1、C6、C7 展示完整声明；C2—C5 展示具名源定理中的证明体，不是可单独运行的 Lean 文件。这些例子用于说明选定路线，并非完整重印七个模块。

**C1：暂设主张，再使用两个前提**

以下是 `C1_Inside.lean` 中 `not_inside` 的完整声明，两个前提都显示在参数中。`Inside` 表示所提出的身内定位，`KnowsInside` 表示本次重建要求的了知内部。

```lean
theorem not_inside
    (Inside KnowsInside : Prop)
    (inside_requires_inner_knowing : Inside → KnowsInside)
    (no_inner_knowing : ¬ KnowsInside) :
    ¬ Inside := by
  intro inside
  have knows_inside : KnowsInside := inside_requires_inner_knowing inside
  exact no_inner_knowing knows_inside
```

`Prop` 表示命题。参数 `inside_requires_inner_knowing` 提供蕴含关系，`no_inner_knowing` 提供对其后件的否定。为了证明 `¬ Inside`，`intro inside` 暂时接下一个 `Inside` 的证明，并不是说 `Inside` 已经为假。`have` 这一行把蕴含关系用于这个临时假设，得到 `KnowsInside` 的证明。最后，`exact no_inner_knowing knows_inside` 把该证明交给否定条件，得到矛盾。在 Lean 中，`¬ P` 就是 `P → False`。因此，推理排除了临时假设，而两个显式前提仍然保留。

**C2：由另一条前提提供否定**

`C2_Outside.lean` 中的 `not_outside` 接收 `outside_prevents_knowing : Outside → ¬ BodyMindKnowTogether` 和 `body_mind_know_together : BodyMindKnowTogether`。它的证明体如下：

```lean
  intro outside
  have not_knowing : ¬ BodyMindKnowTogether := outside_prevents_knowing outside
  exact not_knowing body_mind_know_together
```

在外的临时假设推出身心不能相知。最后一行把已经承认的相知交给这个否定。C1 与 C2 共用一种得到矛盾的推理形式，但各自连接前提的文本含义不同。

**C3：调用已经证明的分支**

`C3_InRoot.lean` 中 `not_in_root_two_branches` 的证明体，使用前文概括的三条显式连接：所提潜根解释要求见眼，也要求成随；而见眼会排除这种成随。

```lean
  intro in_root
  have sees_eye : SeesEye := in_root_requires_seeing_eye in_root
  exact (not_in_root_of_seeing InRoot SeesEye FollowsSeeing
    in_root_requires_following seeing_eye_prevents_following sees_eye) in_root
```

候选模型本身提供 `SeesEye`。最后的表达式把已经证明的见眼分支 `not_in_root_of_seeing` 应用于暂设的潜根主张。该分支使用关于 `FollowsSeeing` 的不相容要求。这条汇总路线没有另加一项实际不见眼的事实假设。

**C4：拆出主张所承诺的条件**

`C4_LightAndDarkness.lean` 中的 `not_ordinary_darkness_explanation` 接收 `ordinary_content : Ordinary → SeesDark ∧ InnerEvidence`、`seeing_requires_facing : SeesDark → FacesEye` 和 `facing_excludes_inner_evidence : FacesEye → ¬ InnerEvidence`。证明体是：

```lean
  intro ordinary
  obtain ⟨sees_dark, inner_evidence⟩ := ordinary_content ordinary
  have faces_eye : FacesEye := seeing_requires_facing sees_dark
  exact facing_excludes_inner_evidence faces_eye inner_evidence
```

`obtain` 拆出通常见暗解释的两个承诺：见到暗，以及把它当作见内的充分证据。证明先得到成见所需的相对关系，再使用显式连接排除上述确证。结论排除的是 `Ordinary`，不是 `SeesDark`。这一摘录仅覆盖通常见暗分支；返观解释和补充分支仍分别处理。

**C5：分别调用有体、无体两个分支**

`C5_AtContact.lean` 中 `not_at_contact_all_cases` 的证明体，接收显式分类 `body_cases : HasBody ∨ ¬ HasBody`，以及表1所述的相合与到达条件。这里 `HasBody` 表示所执心体有所指，不表示物质身体。

```lean
  rcases body_cases with body | no_body
  · exact not_at_contact_with_body Claim HasBody FromInside FromOutside SeesInside SeesFace
      body embodied_contact_requires_arrival inside_requires_sight
      outside_requires_face no_inside_sight no_direct_face
  · exact not_at_contact_without_body Claim HasBody CanContact
      claim_requires_contact no_body_no_contact no_body
```

`rcases` 分开两种情况。第一个调用把 `body` 和内出、外入的条件传给已经证明的有体分支；第二个调用把 `no_body`、主张要求能合、无体不能合的条件传给另一分支。分类命题不是根据章节名称推出来的，内出外入条件也没有强加到无体分支。

**C6：把“只兼根”的连接写出来**

C6 主定理针对同一种兼属关系，区分兼两边、只兼根、只兼尘和全不兼。下面是 `C6_Middle.lean` 中 `not_middle_of_root_only` 这一分支的完整声明。`Root` 与 `Dust` 表示候选的兼属关系，`RootSide` 表示完全归属根方。

```lean
theorem not_middle_of_root_only (Claim Root Dust Middle RootSide : Prop)
    (claim_requires_middle : Claim → Middle)
    (root_only_at_side : Root → ¬ Dust → RootSide)
    (root_side_not_middle : RootSide → ¬ Middle)
    (root : Root) (no_dust : ¬ Dust) : ¬ Claim := by
  intro claim
  have middle : Middle := claim_requires_middle claim
  have root_side : RootSide := root_only_at_side root no_dust
  exact root_side_not_middle root_side middle
```

原主张要求 `Middle`。具名连接从 `root` 与 `no_dust` 得到 `RootSide`，再由另一条显式连接排除 `Middle`。因此，“只兼根，所以不成所说的中间”，不是单靠字面比较得出的，而使用了两项明确声明的解释条件。汇总定理另行处理其他三种情况。

**C7：沿体相到所在的连接推导**

以下是 `C7_Unlocated.lean` 中有体分支 `not_unlocated_with_body` 的完整声明，所在连接直接显示在参数里。`HasBody` 表示该候选具有模型所立的相应所指；`HasForm` 表示相应体相，不只指可见形状。

```lean
theorem not_unlocated_with_body (Claim HasBody HasForm Located : Prop)
    (claim_requires_no_location : Claim → ¬ Located)
    (body_has_form : HasBody → HasForm)
    (form_has_location : HasForm → Located)
    (body : HasBody) : ¬ Claim := by
  intro claim
  have form : HasForm := body_has_form body
  have located : Located := form_has_location form
  exact claim_requires_no_location claim located
```

给定的 `body` 先得到 `HasForm`，再得到 `Located`。临时主张则给出 `¬ Located`，由此形成矛盾。有所在这一结果依赖 `form_has_location`；Lean 没有证明凡存在者都必须有空间位置。这只是一个分支，`not_unlocated_all_cases` 还需要无体分支及显式分类条件。

#### 4.4 三个有启发性的重建问题

C3 显示，分配功能角色与用定义禁止角色重叠，是两回事。这个候选既必须见眼，又必须维持其所主张的见与分别即时相随的关系。经文「若見眼者，眼即同境，不得成隨」（0107c05）为冲突提供依据。重建将三项前提公开列出：潜根要求见眼；潜根要求随见关系；在所设模型中，见眼会妨碍这种关系。第三项仍是实质性前提，不能因此变成普遍定理，声称感官永远不能同时成为被观察的对象。

C4 说明，有吸引力的转述也可能过强。眼与所见暗境有区别，本身并不证明这个暗境在解剖位置上处于身体外部。重建要检查的是：见暗能否确立所声称的见内。另一个补救方案提出返观。要从返观连接到直接见自己的脸，需要明确假设：所主张的这种能力应贯通闭眼与开眼。如果没有这个连接，不能见面便无法反驳所有可以设想的向内觉察。暗室对比、归属追问和二知的后续讨论，被保留为补充路线，不强行全部塞进一个主证明。

C6 需要明确分类。除了兼根尘两边和两边都不兼之外，重建中的模型也可能只属根或只属尘。实现补入了这两种情况，并增加连接：仅属于一边，不能构成所独立设立的中间。这样才补全所选的逻辑分类。这是解释上的补充，并不是说经文本来就用这些措辞逐项列举了四种情况。

#### 4.5 范围见证与删除前提

仅凭编译成功，无法看出一组前提是否自相矛盾，从而使任何反驳都能轻易推出。因此，项目提供前提可满足的见证，并使用独立 Python 程序穷举转写后的前提公式的布尔赋值。审计还逐项删除实质前提，寻找目标主张仍然为真的赋值。

对于选定的公式，每组受检前提都有满足它们的赋值；删除任一项受检前提后，也都能找到目标主张仍成立的反例。这确立的是一项精确但有限的性质：这些命题前提组可满足，并且在所检查的逐项删除意义下，各项前提都不能省略。它不证明这些是在任何语言中最弱的可能前提，也不证明它们是唯一恰当的经文解释。

某些分类讨论，包括 C5—C7，还显式接收排中律假设。这些逻辑输入，必须与布尔审计所计入的实质连接区分。布尔穷举本身采用二值赋值，不是针对直觉主义逻辑一切可能解释的完备性检验。

### 5. 从局部经文的独立验证，到找到隐藏的共同解释

前面的研究分别处理七处征心的七段经文：先找出每一处要反驳的主张，再列明反驳所需的前提条件，最后用 Lean 检查能否在这些条件下推出相应的否定结论。这样，七处各自完成了局部的条件推导。

在此基础上，本文进一步探讨：能否不再逐一调用原有七组分散的前提，而找到贯通这些问答的共同解释，使证明结构得到简化？

通过对照经文、注疏和各段论证，本研究找到了一种可以统摄七处的共同解释：**七处征心所破的，是把能知者与所知境界分立起来，再将这个能知者认作真实的自心。** 随后，本文将这一解释整理成一个共同排除原则和七条逐段连接条件，交给 Lean 检查统一后的推导；该条件证明通过了核验。

这里简化的是重复的证明结构，并不是把所有前提都删除。新的共同证明不再使用原来的七组局部前提，但仍需明确采用共同解释，并说明每一处为何符合这一解释。经文与注疏提供了寻找共同解释的依据；Lean 核验的是：接受这些条件后，七处相应的心性认定是否都能被排除。原有的逐段证明仍然保留。

#### 5.1 共同解释要检查什么？

问题可以说得更直接：**七次回答虽然不同，阿难是不是始终把一个与所知境界分立的能知者，认作真实的自心？** 如果各段确实包含这种认定，并接受本文所采用的“能所不二”解释，就可以用同一个理由排除这些认定。这里要分清：“某种认识活动发生了”，与“这种活动就是所求的心性”，是两回事。

C5、C6 正好显示这个区别。C5 谈的是随相合而有的思惟心，C6 援引的是依根尘而生的识。阿难在这两处已经谈到条件关系，因此不能把共同问题说成“这些心都不依赖条件”。要审查的是：他是否把依条件发生的认识活动，又认作一个与所知境界分立的自心。

C7 也说明这一点。即使不为心安排任何处所，也仍可能把它想成另一个独立之物。蕅益的解释提醒我们，只说七处都在否定空间位置，还不足以说明这一处。共同问题在于怎样把心另立出来、认作自心，而不只是给心安排了什么位置。[4]

#### 5.2 一个显式模式

下列符号在陈述条件证明之前，先固定各个表达式的含义。

| 表达式 | 在本重建中的含义 |
|:--|:--|
| `i` | C1—C7 中的一个章节索引 |
| `Description i` | 选定的候选语境描述成立 |
| `Separated i` | 这一说法把能知者实体化为与其对象相对、自立的存在 |
| `Identifies i` | 该候选被正确认定为对话所寻求的心性 |

这里 `→` 表示蕴含，`¬` 表示否定，`∧` 表示合取。`Separated` 不仅仅是通常的功能区分；`Identifies` 不提供关于究竟实在的正面定义。引入共同解释中的排除条件：

> U：对每个 *i*，`Separated i → ¬ Identifies i`。

再引入七条分别需要交代理由的连接：

> Bᵢ：`Description i → Separated i`。

所得到的结论是：

> 对每个 *i*，`¬ (Description i ∧ Identifies i)`。

U 是在各段重复应用的同一个模式。B₁—B₇ 则保留各段具体的解释责任。因此，这种构造减少的是重复的证明结构，而没有免除说明每段为何属于共同读法的责任。

下面是已经核验的源文件中的通用证明，代码保持原样：

```lean
theorem exclude_identification (Description Separated Identifies : Prop)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) :
    ¬ (Description ∧ Identifies) := by
  intro claim
  have separated : Separated := bridge claim.1
  exact common_exclusion separated claim.2
```

先假设描述和认定同时成立。连接条件给出分立，共同排除条件便与认定发生矛盾。内核检查的是：对任意满足所陈述形式的命题，这一步推导都有效。它不阅读中文术语，也不判断连接是否公允地表示了经文。

#### 5.3 七条连接，七项责任

| 段落 | 选定的主张 | 拟议连接的语境依据 | 不能与该连接混淆的更强主张 |
| :-- | :-- | :-- | :-- |
| C1 | 能知之心在身体内部 | 能知候选被断言住在身内 | 仅有身体位置就意味着实体化 |
| C2 | 能知之心在身体外部 | 候选被移到身外，却仍被认作自心 | 一切外部过程都不能相互联系 |
| C3 | 心潜藏在感官之根中 | 潜根和瑠璃譬喻把一个能知候选单独确立出来 | 不同感知功能本身就是错误的 |
| C4 | 见暗能够确立见内 | 见暗被用来挽回所主张的身内之心 | 一切见暗经验都意味着实体化的我 |
| C5 | 心在相合之处存在 | 「即思惟體實我心性」把思惟候选认作自身心性 | 依条件生起意味着因果独立 |
| C6 | 心是根尘之间可独立指认的中间 | 「識生其中則為心在」在这段问答中给候选安置了一个中间 | 缘起本身被反驳 |
| C7 | 存在一个能知的心，但它没有所在之处 | 依蕅益的读法，无所在仍留下另立之物 | 仅仅没有位置就意味着分立 |

**表2。** 解释连接所承担的责任。右栏列出更强的主张，它们不是共同证明的前提。

读者可以接受这个证明，却拒绝某一条连接。例如，对 C6 的功能性读法可以理解根尘条件间生识，而不设立一个独立自心。这样的读法不一定满足 B₆。形式化标明分歧在哪里，而不是依靠章节标签解决分歧。

**从一条通用证明到七段经文。** 上面的代码解释了同一种反驳如何成立。要证明它覆盖七处，还需要逐一交代：为什么每一处的说法都把能知者与所知境界分立起来？源文件用下面的结构公开列出这七项条件：

```lean
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
```

`Chapter` 只有七种情况，分别对应 C1—C7。`PassageBridges` 中每一行都是一条需要经文解释支持的连接。例如，第一行说：接受本文对 C1 的语境解读，就会得到该段把能知者与所知境界分立的判断。这些连接由研究者提供，并不是 Lean 根据编号自动推导出来的。

**逐段接入同一个理由。** 下面的原文代码逐一检查七种情况，各取对应的连接：

```lean
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
```

`intro i` 表示任取一段；`cases i` 把它分成七种可能；每一行 `exact bridges.c1` 这样的指令，都取出该段自己的连接。七种情况全部列出，才得到“对每一段都能从描述走到分立”的结论。这里完成的是覆盖检查，七条连接本身仍是明确前提。

**汇总为七处的共同条件证明。** 接着，源文件将任意一段的连接交给前面的通用证明：

```lean
theorem seven_identifications_refuted
    (Description Separated Identifies : Chapter → Prop)
    (common_exclusion : ∀ i, Separated i → ¬ Identifies i)
    (bridges : PassageBridges Description Separated) :
    ∀ i, ¬ (Description i ∧ Identifies i) := by
  intro i
  exact exclude_identification (Description i) (Separated i) (Identifies i)
    (common_exclusion i) (bridge_for_each Description Separated bridges i)
```

`seven_identifications_refuted` 同时接收共同排除条件和七条连接。`∀ i` 表示结论适用于七段中的每一段。最后一行从 `bridge_for_each` 取出本段的连接，再用 `common_exclusion i` 排除把这个能知者认作所求心性的判断。它不需要重新调用七组局部证明的前提，因为这一层每次只走同样的两步：从本段描述推出分立，再由共同原则排除心性认定。

**为什么这个理由能够用于七段？** 经文中的说法虽然不同，但按表2所列的解读，它们都保留了同一种认定。例如，C1 将住在身内的能知者认作自心；C5 将随相合而有的思惟心认作自心；C7 虽然取消处所，仍另立一个能知之物并认作自心。其余各段也必须分别说明同样的连接，不能仅因属于“七处征心”就自动纳入。只要七条连接都得到接受，共同排除原则就能对七段分别生效；若某一段的连接不能成立，这套共同证明就不能据此反驳那一段。

因此，此处“满足七段的证明”有明确含义：**在共同原则和七条连接下，七段中相应的自心认定都被排除。** 这套代码展示了七段如何共享一种推理结构；它没有逐句重演七段经文中的所有反诘，也没有把原有局部证明的目标自动改写成共同结论。

#### 5.4 为什么不能悄悄加强目标

共同结论排除的是描述与认定的合取。它不证明 `¬ Description i`。一个满足前提的赋值可以是：描述为真、分立为真、认定为假。这个例子明确显示，仍可承认所描述的活动，同时拒绝把它提升为所求心性。

若要把结果转到另行命名的局部 `Claim`，还需要一项前提：`Claim → Description ∧ Identifies`。实现提供了一个转接定理，但没有悄悄用这些内容实例化原有 C1—C7 的命题。共同模块既不导入，也不替换原证明，而是提供额外的解释层。

转接定理的原文如下。`claim_content` 要求先说明：这里要反驳的完整主张，确实同时包含对能知者的描述，以及把它认作所求心性的判断：

```lean
theorem refute_contextual_claim (Claim Description Separated Identifies : Prop)
    (claim_content : Claim → Description ∧ Identifies)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) : ¬ Claim := by
  intro claim
  exact exclude_identification Description Separated Identifies
    common_exclusion bridge (claim_content claim)
```

例如，在 C1 的共同解读中，若把完整主张写成“住在身内的这个能知者，就是所求的自心”，才可以据此说明它包含上述两个部分。先用 `claim_content` 取出这两部分，再交给共同证明，即可否定这个完整主张。若只写“某种身体内部的认识活动存在”，便没有提供同样的心性认定，不能沿用这一步直接否定它。

这也说明，若称“Lean 发现了不二”，会失于准确。共同原则在形式化之前，已经通过人的解释和注疏研究被提出。Lean 核验的是它的条件后果。这项工作使人看清的是拟议共同性的逻辑形式、所需连接及精确边界。

### 6. 核验结果与可复现性

本研究最主要的核验结果，是共同解释使七段论证的前提组织和证明结构得到大幅简化。局部重建时，每一段都需要自己的前提组合，并沿不同的反诘路线完成推导。例如，C1 要说明“在内为何应当知内”，C3 要说明潜根与见眼之间的关系，C4 则要逐步检查见暗、返观与见面的说法。共同重建不再逐一调用这些原有前提，而将所需条件统一组织为：**一个共同排除原则，加上七条从各段说法通向共同解释的连接条件。** 第5节的汇总代码表明，只要这些条件成立，七段相应的自心认定都可由同一个证明步骤排除。

这种简化体现在推导的组织方式：原来分别处理的多条路线，现在可以复用一套简短的条件证明；逐段需要说明的重点，转为“这一段为何符合共同解释”。这里没有统计并宣称前提数量减少了某个比例，也没有把全部局部反诘压缩成一个无条件定理。七条连接仍各自承担解释责任，而且共同结论针对的是各段的自心认定；要转接原有局部主张，仍须说明其包含哪些内容。因此，核验支持的是**共同解释下的证明结构简化**，原有局部论证保留为可以独立检查的研究成果。

项目使用 Lean 4 `v4.35.0-rc2`，由 `lean-toolchain` 固定版本，不依赖 Mathlib。受检的局部模块包含49个定理声明；v1.0 的共同模块新增8个。新增声明包括七种情况的覆盖、排除与转接结果，以及记录前提可满足和前提缺失后果的见证。内核依赖报告显示，这57个声明没有额外公理依赖。即便该列表为空，显式定理参数仍然是假设。仓库中另存的历史 `Core` 模型，不属于这57个声明的表述范围。

| 受检公式组 | 检查的布尔赋值数 | 满足前提的赋值数 |
|:--|--:|--:|
| C1 | 4 | 1 |
| C2 | 4 | 1 |
| C3 | 8 | 3 |
| C4 主路线 | 256 | 12 |
| C4 补充后续路线 | 128 | 3 |
| C5 | 128 | 3 |
| C6 | 256 | 33 |
| C7 | 32 | 5 |
| 共同三变量模式 | 8 | 4 |

**表3。** 对明确转写的命题公式作穷举检查。C4 补充行不是第八处。最后一行表示检查了8种赋值，其中4种满足前提。

对于共同模式，全部4种兼容赋值都排除描述与认定的合取。删除 U 后，三个命题可以同时为真。删除连接后，描述与认定可以为真，而分立为假。补充见证还显示，删除七条连接中的任意一条，就允许那一处的认定成立，同时仍保留共同排除和另外六条连接。Lean 源码另行证明了相应的见证结果；Python 审计则检查其自身转写的公式。

本次 v1.0 同时提供七个局部模块与共同解释扩展。[版本发布页](https://github.com/1714065/surangama-formalization/releases/tag/v1.0)提供源码、论文和核验材料。旧 v0.2.1 归档保持不变，不包含该共同扩展。[8]

在 v1.0 源码归档的仓库根目录中，使用固定的 Lean 工具链和 Python 运行：

```text
lake build
lake env lean lean/Surangama/SevenLocations/Audit.lean
python tools/check_scope.py
python tools/check_shared_nonduality.py
```

两条 Python 命令重新生成 `audit/propositional-scope.json` 和 `audit/shared-nonduality-scope.json`，表3的计数来自这两个文件。论文目录的 `MANIFEST.sha256` 记录公开稿件文件散列；`supplement/verification.json` 记录发布核验。随稿复核指南列明共同模块8个声明各自的作用。

### 7. 意义与局限

本案例提出了一种评估共同解释的实用标准：明确说出共同排除条件，以可分别审阅的连接说明它覆盖各段，保留原来的局部论证，并展示其结论与读者可能误推的更强主张之间的差别。这样做使共同解释更容易接受审查。这是方法上的成果，不是衡量教义真理的数值指标。

主要局限在语义层面。引入一个名为 `Separated` 的命题很容易，但要说明具体问答确实满足它，需要经文解释。如果把“正确认定”直接定义为“没有分立”，共同模式也可能陷入循环。本文把二者保留为独立的命题参数，并公开采用 U 作为假设。这避免隐藏的定义伪装成发现，但并没有证明实质原则本身。

重建是有选择的。它没有形式化每个譬喻、每句话或每位注家的读法。原子命题省略了时间、知觉和语义的细节。在当前层次足够的连接，放进更丰富的模型后可能需要修订。同样，一种有效解释并不排除使用不同前提的另一种有效重建。

这项方法通过揭示新学科需要在哪些地方补充证据，支持跨学科研究。例如，心理学理论需要操作性定义，把文本命题与可测量的过程连接起来。物理学理论则需要独立论证的对应关系，而不能只因使用了“场”或“观察者”等共同词汇就建立对应。本文没有确立这类经验性或物理学上的同一认定。

后续工作可以比较 C3、C4、C6 的替代连接，记录具备相关知识的读者之间的分歧，并检验形式结构是否帮助他们更准确地找到争论所在。这类研究可以评估方法的可用性与解释责任。本研究只有一组语料，不能据此证明准确率提高、研究时间减少，或某个佛教读法具有唯一正确性。

### 8. 结论

七处可以分别重建为局部条件论证，也可以另行通过关于能知者实体化的共同解释来考察。前提一旦明确，Lean 就能核验局部推导和共同排除模式。范围见证同时展示选定假设可相容，以及它们不支持哪些结论。

方法上的成果，是让成果文件中的责任分工保持可见：资料为解释提供理由，研究者为连接辩护，证明助手检查由此得到的推导。共同主题因而变成一组可以审阅的责任，而不只是印象，或关于宗教真理的无条件定理。

### 数据、作者责任与 AI 辅助

已发布的软件可从[项目仓库](https://github.com/1714065/surangama-formalization)和特定版本归档获取[8]。v1.0 归档包含共同层及核验材料。稿件包不重新分发现代注疏全文。项目持有版本的书目信息，应在投稿前根据书名页与版权页补齐。

AI 系统参与了研究对话、资料整理和代码开发。AI 辅助起草，作者本人决定解释口径，并对文档进行审阅。AI 辅助不能代替所记录的证明检查，也不表示获得了独立学术认可。

### 参考文献

1. *Da foding rulai miyin xiuzheng liaoyi zhu pusa wanxing shoulengyan jing*《大佛頂如來密因修證了義諸菩薩萬行首楞嚴經》。《大正藏》第19册，第945号，卷一，0106c21—0109a15。CBETA 转录本；[在线文本](https://cbetaonline.dila.edu.tw/zh/T0945_001)。项目保存本地转录本和带定位的摘录。
2. Fuenmayor, David, and Christoph Benzmüller. 2019. “A Computational-Hermeneutic Approach for Conceptual Explicitation.” [arXiv:1906.06582v2](https://arxiv.org/abs/1906.06582v2)。相关出版 DOI：[10.1007/978-3-030-32722-4_25](https://doi.org/10.1007/978-3-030-32722-4_25)。
3. de Moura, Leonardo, and Sebastian Ullrich. 2021. “The Lean 4 Theorem Prover and Programming Language.” *Automated Deduction—CADE 28*, 625–635。[doi:10.1007/978-3-030-79876-5_37](https://doi.org/10.1007/978-3-030-79876-5_37)；[作者提供的论文](https://lean-lang.org/papers/lean4.pdf)。
4. Ouyi Zhixu 蕅益智旭。《楞嚴經文句》卷一，第七处及后续二种根本的注释。项目 PDF 物理第49—50页；[在线转录本](https://zh.wikisource.org/zh-hant/楞嚴經文句/卷第1)。不同转录本的标点可能不同。
5. Taixu 太虛。《大佛頂首楞嚴經攝論》，“破處計以無在顯”。[在线文本](https://book.bfnn.org/books2/1066.htm)。
6. Hanshan Deqing 憨山德清。《楞嚴經通議》卷一，七处问答注释。《卍续藏》X12、第279号；[在线转录本](https://hermit.place/zh-TW/canon/x/x12n0279/juan-01/)。
7. Chengguan 成觀。《大佛頂首楞嚴經義貫》。项目保存的简体中文 PDF，开篇问答见物理第52页。这里指现代注家成觀，不是唐代华严宗澄觀。版本出版信息尚待补齐。
8. Wu, Jason. 2026. *Śūraṅgama Sūtra Argument Formalizations (Lean 4)*，v1.0。[GitHub 版本归档](https://github.com/1714065/surangama-formalization/releases/tag/v1.0)；[各版本 DOI](https://doi.org/10.5281/zenodo.22950552)。版本 DOI 见发布页。
