# Reconstructing Arguments in the Śūraṅgama Sūtra with Lean

## Premises and an Interpretive Framework for the Seven Locations of Mind

**Jason Wu** · ORCID: [0009-0003-1682-6165](https://orcid.org/0009-0003-1682-6165)  
Research preprint · v1.0 · 4 October 2026

**中文题目：基于 Lean 的《楞严经》论证重建——七处征心的论证前提与解释框架**

### Abstract

Religious arguments often distribute their reasoning across dialogue, analogy, and commentary. A reconstruction must therefore account for both inferential validity and the interpretive decisions that supply its premises. This article presents a Lean 4 case study of the seven proposed locations of mind in the Chinese Śūraṅgama Sūtra. Seven local modules reconstruct selected refutations as conditional proofs, with doctrinal and interpretive commitments supplied as explicit parameters. A second layer investigates a proposed shared reading: the proposals mistakenly identify a separately posited knower, opposed to its objects, as the mind-nature sought in the dialogue. This reading is represented by one common exclusion schema and seven passage-specific bridges. Lean verifies the resulting exclusion of each contextual identification; it does not establish the shared principle or the bridges as facts about the text. Consistency witnesses and premise-omission countermodels make the dependence on these assumptions inspectable. The local corpus contains 49 theorem declarations, and the shared layer adds eight, including scope witnesses. The principal contribution is a reproducible way to distinguish passage-level reconstruction, interpretive unification, and their respective proof obligations. The case demonstrates how a proof assistant can clarify the logical cost of a shared interpretation without turning a theological reading into an unqualified mathematical conclusion.

**Keywords:** Śūraṅgama Sūtra; Lean 4; argument reconstruction; computational hermeneutics; Chinese Buddhism; explicit premises; nonduality

### 1. The research problem

When several passages of a religious text are understood to express a common concern, what would count as a rigorous assessment of that interpretation? A thematic resemblance is insufficient. Conversely, a formal proof can be made trivial by assuming its intended conclusion. The methodological problem is to expose the steps between a proposed reading and the particular passages it claims to explain.

The seven locations of mind, conventionally called 七處徵心, provide a compact case. In fascicle one of the Śūraṅgama Sūtra, Ānanda successively describes mind as inside the body, outside it, concealed in the sensory faculty, disclosed by seeing darkness within, present wherever contact occurs, in the middle, and unattached or without a location. The exchanges do not share a uniform surface form. They employ examples, questions, distinctions between sensory functions, and consequences drawn from proposed models. [1]

This study asks two questions. First, which premises suffice for selected local refutations, and where does reconstruction supply an unstated connection? Second, can a proposed common interpretation support seven parallel conclusions without concealing passage-specific assumptions?

This study approaches the seven inquiries through a common question: **although Ānanda changes his account of mind, does he keep assuming a knower separate from its objects and identifying that knower as his true mind?** The study examines whether this identification can stand. This interpretation needs support from scripture and commentary, as well as an explanation for each passage. It supplies neither an ontology of Buddha or tathāgatagarbha nor a formal account of realization. Its methodological commitment is that scriptural guidance, argumentative criticism, machine verification, and religious cultivation are distinct activities.

### 2. Position within computational hermeneutics

Using logic to clarify philosophical argument is an established research direction. Fuenmayor and Benzmüller describe computational hermeneutics as an iterative activity in which formal correctness and the dialectical role of an interpretation are assessed together. Their work provides a relevant precedent for revising formalizations in dialogue with interpretation. [2]

Lean 4 combines a programming language with an interactive theorem prover. Here it is used to check proof terms for explicitly stated conditional propositions. [3] The logical content of the present proofs is elementary. The project does not introduce a new calculus or a difficult mathematical theorem. Its contribution is a documented application in which textual evidence, interpretive bridges, proof checking, and countermodels can be inspected separately.

Three features distinguish the case design. The corpus is small enough for passage-by-passage accountability. Two formal layers preserve the difference between local refutation and thematic unification. Finally, successful proofs are accompanied by witnesses showing what the premises allow and what happens when selected premises are removed. These features support criticism of an interpretation instead of giving the interpreter a certificate of doctrinal correctness.

### 3. Corpus, commentaries, and evidence status

The primary text is the Chinese Taishō text, T19, no. 945, fascicle one. The seven exchanges occupy approximately 0107a12–0108b14. Traditional characters are preserved in quotations; English translations and paraphrases are the author's working renderings. Line references follow the project-held CBETA transcription. The study concerns the argument of this Chinese text and does not settle questions of its historical composition or attribution. [1]

The opening question, 「將何所見？誰為愛樂？」, asks about seeing and loving before asking where mind and eyes are located (0107a04–11). The subsequent discussion of two roots and object-dependent discrimination supplies further interpretive context (0108b28–0108c08; 0109a07–15). Later passages may motivate a reading of the sequence, but they are not silently inserted as premises already accepted in every earlier exchange.

The principal commentary evidence for the shared reading comes from Ouyi Zhixu and Taixu. In his treatment of C7, Ouyi explains that taking an object-dependent image as mind leaves a separately posited thing, even when no fixed place is assigned to it. Taixu characterizes the mistake in terms of taking an image arising through names as one's own mind. These are pertinent interpretive reasons for distinguishing nonlocation from freedom from reification. [4, 5]

Other commentarial emphases remain visible. Hanshan Deqing relates the seven inquiries to attachment involving the aggregates and the body as a support. The project-held commentary by the modern master Chengguan discusses the opening seeing-and-loving exchange through subject–object attachment. These readings help situate the proposal, but do not establish unanimity about the exact formal schema used here. [6, 7]

Evidence is recorded at four levels: scriptural wording; a named commentator's explanation; the researcher's reconstruction; and an explicit formal assumption. A sentence can move from one level to another only with an explanation. In particular, a commentary's support for a general theme does not establish every mathematical implication introduced under that theme.

### 4. Local conditional reconstruction

#### 4.1 Why premises are parameters

Each local module uses propositions for a selected claim and relevant consequences. A bridge such as “if this candidate mind is inside, it must know the body's interior” is supplied as a hypothesis. Lean then checks whether the proposed conclusion follows. The bridge is not declared as a global religious axiom.

For C1 the logical form is especially simple. Let `Inside` represent the claim under investigation and `KnowsInside` the required inner knowing. From `Inside → KnowsInside` and `¬ KnowsInside`, infer `¬ Inside`. The crucial exegetical work lies in the first premise: why should the model under discussion require inner knowing? The hall analogy and the description of the knowing mind motivate that requirement in this reconstruction. A proof of the conditional does not establish that every possible inside-located cognitive process must inspect internal organs.

The same distinction matters in C2. The chosen reading connects an outside mind to a failure of bodily and mental knowing together, then uses their acknowledged connection against that model. It does not establish a general physical law that spatially separate systems cannot interact.

#### 4.2 Coverage of the seven modules

Table 1 summarizes selected main routes. A module can contain additional lemmas and alternative branches without including every sentence in its main theorem. The counts include scope witnesses as well as refutations.

| Module | Selected candidate or claim | Main bridge or division requiring interpretation | Declarations |
|:--|:--|:--|--:|
| C1, Inside | Knowing mind inside the body | Being inside requires inner knowing | 4 |
| C2, Outside | Knowing mind outside the body | Being outside in this model prevents connected bodily and mental knowing | 4 |
| C3, InRoot | Mind concealed in the sensory faculty | The glass analogy requires seeing the eye; treating it as the seen conflicts with the proposed following relation | 10 |
| C4, LightAndDarkness | Seeing darkness establishes inner sight | Ordinary seeing and inward viewing are separated; inward viewing is tested by seeing one's face | 17 |
| C5, AtContact | Mind exists wherever it makes contact | A referent is required for contact; the embodied contact model is divided into inside-out and outside-in routes | 5 |
| C6, Middle | Mind is an independently identified middle between faculty and object | Both sides, either side alone, and neither side are distinguished | 6 |
| C7, Unlocated | A knowing mind exists, but it has no location | In this model, a determinate form implies a whereabouts | 3 |

**Table 1.** Selected local reconstructions; 49 declarations in total. These are not 49 independent discoveries about the scripture. Module labels abbreviate the source filenames: for example, “C4, LightAndDarkness” denotes `C4_LightAndDarkness.lean`.

#### 4.3 Reading the Lean proofs: seven short examples

The excerpts below are taken from the checked C1–C7 files in `lean/Surangama/SevenLocations/`. Full-line comments are omitted; executable statements and names are unchanged. C1, C6, and C7 show complete declarations. C2–C5 show proof bodies in the context of the named source theorem, not standalone Lean files. The examples illustrate selected routes rather than seven complete reproductions of the modules.

**C1: assuming the claim and applying two premises**

The complete declaration `not_inside` from `C1_Inside.lean` makes the two premises visible. `Inside` names the proposed inner location, and `KnowsInside` names the inner knowing required by this reconstruction.

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

`Prop` marks a proposition. The parameter `inside_requires_inner_knowing` supplies the implication, and `no_inner_knowing` supplies its negated consequence. To prove `¬ Inside`, `intro inside` temporarily assumes a proof of `Inside`; it does not assert that `Inside` is false. The `have` line applies the implication to obtain a proof of `KnowsInside`. Finally, `exact no_inner_knowing knows_inside` applies the negation to that proof and produces a contradiction. In Lean, `¬ P` means `P → False`. The reasoning therefore discharges the temporary assumption while retaining both explicit premises.

**C2: reversing which premise supplies the negation**

In `C2_Outside.lean`, `not_outside` receives `outside_prevents_knowing : Outside → ¬ BodyMindKnowTogether` and `body_mind_know_together : BodyMindKnowTogether`. Its proof body is:

```lean
  intro outside
  have not_knowing : ¬ BodyMindKnowTogether := outside_prevents_knowing outside
  exact not_knowing body_mind_know_together
```

The outside assumption yields the negation of connected bodily and mental knowing. The last line supplies the acknowledged connection to that negation. C1 and C2 share a contradiction pattern, but the textual meaning of their bridging premises differs.

**C3: using a previously proved branch**

The proof body of `not_in_root_two_branches` in `C3_InRoot.lean` uses the three explicit bridges summarized above: the proposed concealment requires seeing the eye and the following relation, while seeing the eye excludes that relation.

```lean
  intro in_root
  have sees_eye : SeesEye := in_root_requires_seeing_eye in_root
  exact (not_in_root_of_seeing InRoot SeesEye FollowsSeeing
    in_root_requires_following seeing_eye_prevents_following sees_eye) in_root
```

The candidate model itself supplies `SeesEye`. The final expression applies the already proved seeing-eye branch, `not_in_root_of_seeing`, to the temporary concealment assumption. That branch uses the incompatible requirements concerning `FollowsSeeing`. This combined route does not add a separate factual assumption that the eye is not seen.

**C4: extracting what a claim commits one to**

In `C4_LightAndDarkness.lean`, `not_ordinary_darkness_explanation` receives `ordinary_content : Ordinary → SeesDark ∧ InnerEvidence`, `seeing_requires_facing : SeesDark → FacesEye`, and `facing_excludes_inner_evidence : FacesEye → ¬ InnerEvidence`. The proof body reads:

```lean
  intro ordinary
  obtain ⟨sees_dark, inner_evidence⟩ := ordinary_content ordinary
  have faces_eye : FacesEye := seeing_requires_facing sees_dark
  exact facing_excludes_inner_evidence faces_eye inner_evidence
```

`obtain` extracts both commitments of the ordinary-darkness explanation: seeing darkness and taking it as sufficient evidence of inner sight. The proof derives the required facing relation, then applies the explicit bridge excluding that evidence. The conclusion rejects `Ordinary`, not `SeesDark`. This excerpt covers the ordinary branch; the inward-viewing and supplementary branches remain separate.

**C5: dispatching the two contact cases**

The proof body of `not_at_contact_all_cases` in `C5_AtContact.lean` receives the explicit division `body_cases : HasBody ∨ ¬ HasBody`, together with the contact and arrival premises described in Table 1. Here `HasBody` means that the proposed mind has the relevant referent; it does not mean a material body.

```lean
  rcases body_cases with body | no_body
  · exact not_at_contact_with_body Claim HasBody FromInside FromOutside SeesInside SeesFace
      body embodied_contact_requires_arrival inside_requires_sight
      outside_requires_face no_inside_sight no_direct_face
  · exact not_at_contact_without_body Claim HasBody CanContact
      claim_requires_contact no_body_no_contact no_body
```

`rcases` separates the two cases. The first call passes `body` and the inside-out/outside-in conditions to the proved having-a-referent branch. The second passes `no_body`, the requirement of contact, and the no-referent/no-contact condition to the other branch. The disjunction has not been inferred from the chapter title, and the arrival conditions are not imposed on the no-referent branch.

**C6: making the root-only bridge visible**

The C6 main theorem divides the same membership relation into both sides, the root alone, the object alone, and neither. The following complete branch declaration, `not_middle_of_root_only` in `C6_Middle.lean`, shows the root-only case. `Root` and `Dust` concern membership of the candidate, while `RootSide` records complete assignment to the root side.

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

The claim requires `Middle`. From `root` and `no_dust`, the named bridge supplies `RootSide`; another explicit bridge excludes `Middle`. Thus “root only, therefore not the proposed middle” is not obtained merely by comparing words. It uses two declared interpretive conditions. The combined theorem separately handles the other three cases.

**C7: following the form-to-location chain**

The complete having-a-referent branch, `not_unlocated_with_body` in `C7_Unlocated.lean`, exposes the location bridge. `HasBody` means that this candidate has the referent posited in the model; `HasForm` means the relevant determinate form, not merely visible shape.

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

The supplied `body` yields `HasForm`, then `Located`. The temporary claim yields `¬ Located`, completing the contradiction. The location result depends on `form_has_location`; Lean has not established that every existent must have a spatial position. This is one branch: `not_unlocated_all_cases` also requires the no-referent branch and the explicit case division.

#### 4.4 Three instructive reconstruction problems

C3 illustrates the difference between assigning functional roles and prohibiting their overlap by definition. The candidate must both see the eye and preserve the proposed immediate following of seeing by discrimination. The scriptural phrase 「若見眼者，眼即同境，不得成隨」 (0107c05) motivates a conflict. The reconstruction exposes three premises: concealment requires seeing the eye; concealment requires the following relation; and seeing the eye in the posited model prevents that relation. The third premise remains substantive. It does not become a universal theorem that a sensory organ can never also be an object of observation.

C4 reveals why an attractive paraphrase may be too strong. The distinction between eye and dark object does not, by itself, prove that the object is anatomically outside the body. The reconstructive issue is whether seeing darkness establishes the claimed inner sight. A separate rescue introduces inward viewing. Connecting that rescue to direct viewing of one's own face requires the explicit assumption that the proposed ability extends across closing and opening the eyes. Without that connection, inability to see one's face does not refute every conceivable form of inward awareness. The dark-room comparison, ownership question, and two-knowers continuation are preserved as supplementary routes rather than all being forced into one main proof.

C6 requires an explicit classification. Besides belonging to both faculty and object or to neither, a reconstructed model might belong only to the faculty or only to the object. The implementation includes these two cases and adds the bridges that belonging exclusively to one side fails to constitute the independently posited middle. This completes the selected logical division. It is an interpretive supplementation, not a claim that the scripture separately enumerates all four cases in those words.

#### 4.5 Scope witnesses and premise removal

Compilation alone cannot reveal whether a bundle of premises is inconsistent and therefore trivially entails a refutation. The project accordingly supplies consistency witnesses and a separate Python enumeration of Boolean valuations for transcribed premise formulas. This audit also removes one substantive premise at a time and searches for an assignment in which the target remains true.

For the selected formulas, every audited bundle has a satisfying assignment, and every single-premise omission permits a counterexample to the intended refutation. This establishes a precise, limited property: the selected propositional packages are satisfiable and irredundant under the tested individual omissions. It does not prove that these are the weakest possible premises in every language or the uniquely appropriate interpretations of the text.

Some case divisions, including C5–C7, receive explicit excluded-middle hypotheses. Those logical inputs must be distinguished from the substantive bridges counted by the Boolean audit. Boolean enumeration itself uses two-valued assignments; it is not a completeness test for every possible interpretation of intuitionistic logic.

### 5. From separate verification of individual passages to finding an underlying shared interpretation

The preceding analysis treats the seven passages individually: it identifies the claim challenged in each exchange, states the premises needed for its refutation, and uses Lean to check whether the corresponding negative conclusion follows under those conditions. Each passage thereby receives a local conditional derivation.

Building on these results, this study asks a further question: can an interpretation shared across the exchanges simplify the proof structure without invoking the seven original, separate premise packages one by one?

Comparison of the scripture, commentaries, and individual arguments yielded one such shared interpretation: **the seven inquiries challenge the separation of a knower from its objects and the identification of that knower as one's true mind.** This reading was then expressed as one common exclusion principle and seven passage-specific bridges. The resulting unified conditional proof passed Lean verification.

The simplification concerns repeated proof structure; it does not remove every premise. The shared proof no longer uses the seven original local premise packages, but it still adopts the common interpretation explicitly and requires an account of why each passage falls under it. Scripture and commentary motivate the search for that interpretation. Lean checks whether the seven corresponding identifications can all be excluded once the stated conditions are accepted. The original passage-level proofs are retained.

#### 5.1 What does the shared interpretation examine?

The question can be stated directly: **despite the differences between his seven answers, does Ānanda keep identifying a knower separate from its objects as his true mind?** If each passage makes this identification, and the adopted nonduality interpretation is accepted, the same reason can exclude each identification. An occurrence of cognition and the identification of that activity as the sought mind-nature are different claims.

C5 and C6 illustrate the distinction. C5 concerns a thinking mind present at contact, and C6 invokes consciousness arising through faculty and object. These proposals already involve conditions, so their common problem cannot be characterized as an absence of dependence on conditions. The question is whether condition-dependent cognition is nevertheless identified as a self-mind separate from its objects.

C7 makes the same issue visible. Even a mind assigned no location can still be conceived as a separate thing. Ouyi's explanation suggests that simply describing all seven inquiries as denials of spatial location is insufficient for this exchange. The shared issue concerns how mind is separately posited and identified, rather than just where it is placed. [4]

#### 5.2 An explicit schema

The following notation fixes the meaning of each expression before stating the conditional proof.

| Expression | Meaning in this reconstruction |
|:--|:--|
| `i` | One of the seven chapter indices, C1–C7 |
| `Description i` | The selected contextual account of a candidate holds |
| `Separated i` | The account reifies a knower as separately subsisting over against its objects |
| `Identifies i` | The candidate is correctly identified as the mind-nature sought in the dialogue |

Here `→` means implication, `¬` means negation, and `∧` means conjunction. `Separated` exceeds ordinary functional differentiation; `Identifies` supplies no positive definition of an ultimate reality. Introduce the common interpretive exclusion:

> U: for every *i*, `Separated i → ¬ Identifies i`.

Introduce seven individually accountable bridges:

> Bᵢ: `Description i → Separated i`.

The resulting conclusion is:

> For every *i*, `¬ (Description i ∧ Identifies i)`.

U is a single repeated schema. B₁–B₇ retain the passage-specific interpretive burden. The construction therefore reduces repeated proof structure without eliminating the need to justify how each passage falls under the shared reading.

The exact generic proof below occurs in the checked source:

```lean
theorem exclude_identification (Description Separated Identifies : Prop)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) :
    ¬ (Description ∧ Identifies) := by
  intro claim
  have separated : Separated := bridge claim.1
  exact common_exclusion separated claim.2
```

Assume the description and the identification together. The bridge supplies separation, and the common exclusion then contradicts the identification. The kernel checks that this step is valid for arbitrary propositions of the stated form. It does not read the Chinese terms or determine whether the bridge fairly represents them.

#### 5.3 Seven bridges, seven obligations

| Passage | Selected claim | Contextual basis for the proposed bridge | What the bridge must not be confused with |
| :-- | :-- | :-- | :-- |
| C1 | Knowing mind inside the body | A knowing candidate is asserted to reside inside | Mere bodily location entails reification |
| C2 | Knowing mind outside the body | The candidate is moved outside while retaining its identity as self-mind | All external processes are disconnected |
| C3 | Mind concealed in the sensory faculty | Concealment and the glass analogy individuate a candidate knower | Different sensory functions are inherently false |
| C4 | Seeing darkness establishes inner sight | Darkness is used to rescue the proposed inner mind | Every experience of darkness implies a reified self |
| C5 | Mind exists wherever it makes contact | 「即思惟體實我心性」 identifies the thinking candidate as one's mind-nature | Conditional arising entails causal independence |
| C6 | Mind is an independently identified middle between faculty and object | 「識生其中則為心在」 assigns the candidate a middle in this dialogue | Dependent arising is itself refuted |
| C7 | A knowing mind exists, but it has no location | Nonlocation leaves, on Ouyi's reading, a separately posited thing | Absence of location by itself implies separation |

**Table 2.** Interpretive bridge obligations. The right column identifies stronger claims that are not premises of the shared proof.

A reader can accept the proof and reject a bridge. For example, a functional reading of C6 might understand consciousness arising between conditions without positing a separate self-mind. That reading need not satisfy B₆. The formalization identifies the disagreement rather than resolving it through the chapter label.

**From one generic proof to seven passages.** The preceding code shows why one pattern of refutation works. To cover all seven inquiries, the reconstruction must also explain why each account separates the knower from its objects. The source exposes these seven conditions in the following structure:

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

`Chapter` has exactly seven cases, corresponding to C1–C7. Each field of `PassageBridges` is a connection requiring textual justification. The first field, for example, states that accepting this study's contextual reading of C1 yields the judgment that the account separates the knower from its objects. Researchers supply these connections; Lean does not derive them from the chapter labels.

**Connecting each passage to the same reason.** The following unchanged source code checks the seven cases in turn and selects the corresponding connection:

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

`intro i` selects an arbitrary passage; `cases i` separates the seven possibilities; each instruction such as `exact bridges.c1` retrieves that passage's own connection. Covering every case establishes that the transition from description to separation is available for every passage. This proves coverage; the seven connections themselves remain explicit premises.

**Combining the seven conditional results.** The source then supplies an arbitrary passage's connection to the generic proof:

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

`seven_identifications_refuted` takes both the common exclusion and the seven connections as parameters. `∀ i` means that the conclusion applies to every one of the seven passages. The final line obtains the relevant connection from `bridge_for_each` and uses `common_exclusion i` to exclude identifying that knower as the sought mind-nature. It need not invoke the seven local premise packages again: at this level, each case follows the same two steps, from its contextual description to separation, and from separation to exclusion of the identification.

**Why can this reason apply to all seven?** Although the accounts differ, the readings in Table 2 attribute a recurring identification to them. C1 identifies a knower residing inside the body as self-mind; C5 identifies the thinking mind present at contact as self-mind; C7 removes location but still separately posits a knowing thing and identifies it as self-mind. Each remaining passage requires its own justification of this connection; membership in the seven inquiries does not establish it. If all seven connections are accepted, the common exclusion applies to all seven. If a connection cannot be sustained for one passage, this shared proof cannot refute that passage on this basis.

Thus, satisfying the proof obligation for seven passages has a precise meaning here: **under the common principle and the seven connections, the corresponding self-mind identification is excluded in every case.** The code shows how the passages share an inferential structure. It does not replay every challenge in the seven dialogues or automatically replace the targets of the original local proofs with the shared conclusion.

#### 5.4 Why the target cannot be silently strengthened

The shared conclusion excludes the conjunction of description and identification. It does not establish `¬ Description i`. A satisfying assignment with description true, separation true, and identification false makes the distinction explicit: the described activity may be admitted while its elevation to the sought mind-nature is refused.

Transferring this result to a separately named local `Claim` requires another premise, `Claim → Description ∧ Identifies`. The implementation includes a transfer theorem but does not silently instantiate the older C1–C7 predicates with this content. The shared module neither imports nor replaces their proofs. It provides an additional interpretive layer.

The unchanged transfer theorem follows. Its `claim_content` parameter requires showing that the full claim being challenged includes both an account of the knower and its identification as the sought mind-nature:

```lean
theorem refute_contextual_claim (Claim Description Separated Identifies : Prop)
    (claim_content : Claim → Description ∧ Identifies)
    (common_exclusion : Separated → ¬ Identifies)
    (bridge : Description → Separated) : ¬ Claim := by
  intro claim
  exact exclude_identification Description Separated Identifies
    common_exclusion bridge (claim_content claim)
```

For example, within the shared reading of C1, the full claim “this knower residing inside the body is the self-mind sought” can be unpacked into those two components. Applying `claim_content` extracts them; the shared proof then refutes the full claim. Merely asserting that some cognitive activity occurs inside the body supplies no such identification and cannot be refuted by this step alone.

This is also why the phrase “Lean discovered nonduality” would be inaccurate. The shared principle was proposed through human interpretation and commentarial study before being formalized. Lean verifies its conditional consequences. What the exercise brings into view is the logical form, required bridges, and exact limits of the proposed unity.

### 6. Verification results and reproducibility

The central verification result is a substantial simplification in how the premises and proofs for the seven passages are organized under the shared interpretation. Local reconstruction requires a separate premise package and a different sequence of challenges for each passage. C1, for example, needs a connection from being inside to knowing the interior; C3 examines concealment in the faculty and seeing the eye; C4 successively examines darkness, inward sight, and seeing one's face. The shared reconstruction no longer invokes these original premises individually. Instead, it organizes its conditions as **one common exclusion principle plus seven connections from the passage-specific accounts to the shared interpretation.** The combined code in Section 5 shows that, given these conditions, the corresponding self-mind identification in each passage is excluded by the same proof step.

The simplification concerns the organization of inference: several separately developed routes can now reuse one short conditional proof, while passage-specific justification focuses on why the account falls under the shared interpretation. No percentage reduction in the number of premises is asserted, and the local challenges have not all been compressed into an unconditional theorem. Each connection retains its interpretive burden, and the shared conclusion concerns self-mind identification; transfer to an original local claim still requires an account of that claim's content. Verification therefore supports **a simpler proof structure under the shared interpretation**, while the local arguments remain independently reviewable research results.

The project uses Lean 4 `v4.35.0-rc2`, pinned in `lean-toolchain`, without Mathlib. The reviewed local modules contain 49 theorem declarations; the shared module introduced in v1.0 adds eight. The additional declarations include seven-case coverage, the exclusion and transfer results, and witnesses documenting consistency and missing premises. Kernel dependency reports for these 57 declarations list no additional axioms. Explicit theorem parameters remain assumptions despite that empty dependency list. Historical `Core` models elsewhere in the repository are outside this 57-declaration claim.

| Audited formula package | Boolean valuations examined | Satisfying assignments |
|:--|--:|--:|
| C1 | 4 | 1 |
| C2 | 4 | 1 |
| C3 | 8 | 3 |
| C4 main | 256 | 12 |
| C4 supplementary continuation | 128 | 3 |
| C5 | 128 | 3 |
| C6 | 256 | 33 |
| C7 | 32 | 5 |
| Shared three-variable schema | 8 | 4 |

**Table 3.** Exhaustive enumeration of the explicitly transcribed propositional formulas. The supplementary C4 row is not an eighth location. The last row reports **8 assignments examined, of which 4 satisfy the premises**.

For the shared schema, all four compatible assignments exclude the conjunction of description and identification. Removing U allows all three propositions to be true. Removing a bridge allows description and identification to hold while separation is false. Additional witnesses show that omitting any one of the seven bridges leaves that chapter's identification possible while retaining the common exclusion and the other six bridges. The Lean source separately proves corresponding witness results; the Python audit checks its own formula transcription.

This v1.0 release includes both the seven local modules and the shared extension. The [versioned release](https://github.com/1714065/surangama-formalization/releases/tag/v1.0) provides the source, manuscripts and verification materials. Earlier v0.2.1 archives remain separate and do not contain the extension. [8]

From the repository root of the v1.0 source archive, run the following commands with the pinned Lean toolchain and Python:

```text
lake build
lake env lean lean/Surangama/SevenLocations/Audit.lean
python tools/check_scope.py
python tools/check_shared_nonduality.py
```

The two Python commands regenerate `audit/propositional-scope.json` and `audit/shared-nonduality-scope.json`, which supply the counts in Table 3. The manuscript `MANIFEST.sha256` records public manuscript file hashes; `supplement/verification.json` records the release checks. The supplementary verification guide maps the eight shared-module declarations to their roles.

### 7. Implications and limitations

The case suggests a practical criterion for evaluating shared interpretations. A proposed unity becomes more accountable when it names a common exclusion, demonstrates coverage through separately reviewable bridges, preserves the original local arguments, and exhibits the difference between its conclusion and stronger claims readers might infer. These are procedural achievements, not a numerical measure of theological truth.

The principal limitation is semantic. A proposition named `Separated` can be introduced easily; establishing that a specific exchange satisfies it requires exegesis. The common schema might also become circular if “correct identification” were defined simply as “not separated.” Here these are independent propositional parameters and U is openly assumed. This prevents a hidden definition from masquerading as a discovery, but it does not prove the substantive principle.

The reconstruction is selective. It does not formalize every analogy, every sentence, or every commentator's reading. Atomic propositions suppress temporal, perceptual, and semantic detail. Some bridges that suffice at this level might require revision in a richer model. Equally, one valid interpretation does not exclude another valid reconstruction with different premises.

The method supports interdisciplinary work by exposing where a new discipline would need additional evidence. A psychological theory, for instance, would require operational definitions connecting the textual predicates to measured processes. A physical theory would require independently justified correspondences, not shared vocabulary such as “field” or “observer.” No such empirical or physical identification is established here.

Further work can compare alternative C3, C4, or C6 bridges, record disagreements among qualified readers, and test whether the formal structure helps them identify the precise point at issue. Such studies would assess usability and interpretive accountability. The present single corpus does not demonstrate improved accuracy, reduced research time, or a uniquely correct Buddhist reading.

### 8. Conclusion

The seven locations can be reconstructed as local conditional arguments and, separately, examined through a shared interpretation concerning the reification of a knower. Lean verifies the local deductions and the common exclusion schema once their premises are explicit. Scope witnesses show both the consistency of the selected assumptions and the conclusions they do not support.

The methodological result is a division of responsibilities that remains visible in the artifact: sources motivate an interpretation, researchers defend its bridges, and the proof assistant checks the resulting inference. A common theme becomes a set of reviewable obligations rather than an impression or an unqualified theorem about religious truth.

### Data, authorship, and AI assistance

The published software is available from the [project repository](https://github.com/1714065/surangama-formalization) and its version-specific archive [8]. The v1.0 archive includes the shared layer and verification materials. Full modern commentaries are not redistributed in the manuscript package. Bibliographic descriptions of project-held editions should be completed from their title and copyright pages before submission.

AI systems assisted the research dialogue, source organization, and code development. AI assisted in drafting; the author determines the interpretive framing and reviews the manuscript. AI assistance is not a substitute for the recorded proof checks or a claim of independent scholarly endorsement.

### References

1. *Da foding rulai miyin xiuzheng liaoyi zhu pusa wanxing shoulengyan jing* 大佛頂如來密因修證了義諸菩薩萬行首楞嚴經. Taishō, vol. 19, no. 945, fascicle 1, 0106c21–0109a15. CBETA transcription; [online text](https://cbetaonline.dila.edu.tw/zh/T0945_001). Local transcription and locator extracts retained in the project.
2. Fuenmayor, David, and Christoph Benzmüller. 2019. “A Computational-Hermeneutic Approach for Conceptual Explicitation.” [arXiv:1906.06582v2](https://arxiv.org/abs/1906.06582v2). Related publication DOI: [10.1007/978-3-030-32722-4_25](https://doi.org/10.1007/978-3-030-32722-4_25).
3. de Moura, Leonardo, and Sebastian Ullrich. 2021. “The Lean 4 Theorem Prover and Programming Language.” *Automated Deduction—CADE 28*, 625–635. [doi:10.1007/978-3-030-79876-5_37](https://doi.org/10.1007/978-3-030-79876-5_37). [Author-hosted paper](https://lean-lang.org/papers/lean4.pdf).
4. Ouyi Zhixu 蕅益智旭. *Lengyan jing wenju* 楞嚴經文句, fascicle 1, commentary on the seventh location and following two roots. Project-held PDF, physical pp. 49–50; [online transcription](https://zh.wikisource.org/zh-hant/楞嚴經文句/卷第1). Punctuation varies by transcription.
5. Taixu 太虛. *Da foding shoulengyan jing shelun* 大佛頂首楞嚴經攝論, section 「破處計以無在顯」. [Online text](https://book.bfnn.org/books2/1066.htm).
6. Hanshan Deqing 憨山德清. *Lengyan jing tongyi* 楞嚴經通議, fascicle 1, commentary on the seven inquiries. Xuzangjing X12, no. 279; [online transcription](https://hermit.place/zh-TW/canon/x/x12n0279/juan-01/).
7. Chengguan 成觀. *Da foding shoulengyan jing yiguan* 大佛頂首楞嚴經義貫. Project-held simplified-Chinese PDF, physical p. 52 for the opening exchange. “Chengguan” here denotes the modern commentator 成觀, not the Tang Huayan master 澄觀. Edition metadata pending bibliographic completion.
8. Wu, Jason. 2026. *Śūraṅgama Sūtra Argument Formalizations (Lean 4)*, v1.0. [GitHub versioned archive](https://github.com/1714065/surangama-formalization/releases/tag/v1.0); [all-versions DOI](https://doi.org/10.5281/zenodo.22950552). See the release page for its version DOI.
