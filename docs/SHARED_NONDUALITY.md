<!-- SPDX-License-Identifier: CC0-1.0 -->
# Shared nonduality reading (v1.0)

> 经文提供指引，论证检查误认，Lean 核对明确前提下的推导；这些工作的完成，不等于修证的完成。
> 可以在明确前提与适用范围内否定某个论断；不指认“佛”“如来藏”是什么。

The seven proposals are read as reifying an object-directed image into a
separately identifiable knower over against its objects. This is an adopted,
source-informed interpretation, not the unique reading or a proved ontology.
The formal result excludes identification of these candidates as the mind-nature
sought in the dialogue; it does not refute cognition or contextual location.

## Explicit conditions and exact conclusion

`SharedNonduality.lean` uses arbitrary proposition families:
- `Description i`: the selected contextual candidate account holds.
- `Separated i`: it reifies the knower as separately subsisting over against objects.
- `Identifies i`: that candidate is correctly identified as the sought mind-nature.

The common interpretive schema is `forall i, Separated i -> not Identifies i`.
`PassageBridges` contains SEVEN substantive fields `Description ci -> Separated ci`.
Neither family is a global axiom or claimed established by Lean.
`seven_identifications_refuted` proves `forall i, not (Description i and Identifies i)`.
For a separately named target `Claim`, `refute_contextual_claim` additionally
requires `Claim -> Description and Identifies`. The old C1-C7 targets are not
silently identified with this stronger contextual target.

This reduces repeated proof structure and proposes a shared interpretive basis;
it does not eliminate interpretive premises. An empty axiom report does not
remove these explicit parameters. The earlier published 49 declarations are
unchanged; this additional module has eight theorem declarations.

## Passage mapping (all bridges are interpretive conditions)

| Chapter | Textual anchor, T19n0945 fascicle 1 | Adopted connection and limit |
| --- | --- | --- |
| C1 | p107a10-14, p107b01-06: mind inside | Read the located knower as a separately identified self-mind; location alone does not entail reification. |
| C2 | p107b06-21: mind outside | The knower is repositioned as a distinct candidate; no general claim that outside systems cannot interact. |
| C3 | p107b22-c08: concealed in the root | Glass/root model individuates a knower; this is not a ban on distinct sensory functions. |
| C4 | p107c09-23: darkness as inner sight | Its role as a rescue of a located mind is a contextual reconstruction; darkness alone does not entail reification. |
| C5 | p107c23-108a14: thinking substance and contact | `即思惟體實我心性` motivates the identification; dependence on contact does not entail causal independence. |
| C6 | p108a15-b03: consciousness in between | `識生其中則為心在` is read as a mind-body identification; dependent arising alone is not refuted. |
| C7 | p108b04-14: an unattached knower | Ouyi reads a separately posited thing despite no fixed place; nonlocation alone does not entail separateness. |

Opening question: p107a04-09, `將何所見？誰為愛樂？`.
Later interpretive context: p108b28-c08 (two roots), p109a07-15 (testing
object-dependent discrimination). Later context is not retroactively treated
as an already accepted local premise in every earlier exchange.

## Commentary evidence and differences

- Ouyi Zhixu, *Lengyan jing wenju*, fascicle 1, C7 commentary:
  the reified image remains a separately posited thing although not fixed at
  one place. Project-held PDF physical p49; p50 distinguishes dependent
  subject/object functions from additional self/dharma grasping.
  https://suttaworld.com/Collection_of_Buddhist/Successive_Tripitaka/pdf/X13/X13n0285.pdf
- Taixu, *Da foding shoulengyan jing shelun*, section `破處計以無在顯`:
  the common mistake is taking name-conditioned images as one's own mind.
  https://book.bfnn.org/books2/1066.htm
- Chengguan, *Yiguan*, project-held PDF physical p52: opening seeing/loving
  questions are discussed in terms of subject/object grasping. Later passages
  around pp146 and163 concern projecting mind-outside objects and inner/outer division.
- Hanshan Deqing, *Tongyi*, fascicle 1, instead emphasizes attachment to the
  form/feeling aggregates and the body as the mind's support. This difference
  is retained rather than relabeled as unanimous agreement.
  https://hermit.place/zh-TW/canon/x/x12n0279/juan-01/

These sources motivate a reconstruction. They do not certify an exact formal
predicate, and none of these summaries defines Buddha or Tathagatagarbha.

## Reproduction

`lake build`; `tools/print-axioms.ps1` (Windows) or `sh tools/print-axioms.sh`;
`python tools/check_shared_nonduality.py`.
The Boolean check is a bounded audit of explicitly transcribed formulas;
Lean separately checks the actual theorem terms and seven-case coverage.
Witnesses retain all descriptions while rejecting identifications, and allow
an identification when the common exclusion or an individual bridge is removed.
This addition is included in v1.0; v0.2.1 and its DOI remain unchanged.
