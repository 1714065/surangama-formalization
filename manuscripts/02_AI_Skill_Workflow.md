# From Scripture and Commentary to Machine-Checked Arguments

## An AI- and Skill-Assisted Workflow for Research in Religious Humanities

**Jason Wu** · ORCID: [0009-0003-1682-6165](https://orcid.org/0009-0003-1682-6165)  
Methods preprint · v1.0 · 4 October 2026

**中文题目：从经文与注疏到机器核验——一种 AI 与“skill”辅助的宗教人文经典论证研究流程**

*术语说明：本文的 skill 指提供给 AI 助手的书面研究指令及配套参考材料。*

### Abstract

AI assistants can help researchers organize sources and draft formal proofs, but a fluent explanation and a compiling proof are insufficient evidence of a faithful interpretation. This article describes a workflow developed in a Lean reconstruction of the seven locations of mind in the Śūraṅgama Sūtra. A written skill specifies source checking, separation of interpretive commitments, human review of bridging premises, conditional formalization, and synchronized research outputs. A documented dialogue about a shared nonduality reading illustrates the process: an initial framing in terms of independence was revised because some passages explicitly involve dependence on conditions. The resulting formalization concerns reified identification rather than causal independence. The case shows how a human correction can propagate into predicate design, theorem scope, countermodels, and publication claims. A timestamped record and a source snapshot make this sequence inspectable. This descriptive single-case methods report does not establish causal effects of AI assistance or the skill, or gains in accuracy or productivity. Its contribution is a practical allocation of responsibilities among textual evidence, human interpretation, AI assistance, and proof checking.

**Keywords:** AI-assisted humanities; research workflow; Lean; computational hermeneutics; auditability; Buddhist studies; research provenance

### 1. Why a workflow is needed

An AI assistant may generate a persuasive account of a religious argument while overlooking an ambiguous word or an unstated premise. It may also produce Lean code that compiles because the desired result has effectively been assumed. These are distinct problems: textual fidelity and inferential validity cannot be assessed by the same test.

The case reported here concerns seven exchanges about the location of mind in the Chinese Śūraṅgama Sūtra, T19, no. 945, fascicle one. Earlier project work reconstructed selected arguments in seven local Lean modules. A subsequent dialogue asked whether they could be understood through one common principle. The difficulty was not long proof search. It was deciding what exactly a common principle would mean, whether each passage supported the proposed connection, and whether the resulting theorem answered the original question. [1, 2]

Computational hermeneutics already provides a precedent for coordinating formal argument analysis with interpretive revision. [3] This report focuses on the operational details of such coordination when an AI assistant and a reusable written instruction package participate. Lean checks the formal terms; it does not adjudicate philology or religious authority. [4]

### 2. What “skill” means in this study

The skill used in the project is a local Markdown instruction document, `sutra-argument-lean/SKILL.md`, accompanied by project context and workflow references. The author retains a dated copy of these instructions in the private research archive. It tells an assistant what material to collect, how to distinguish evidence from reconstruction, and which checks and deliverables to produce. The instruction document is not a trained model or a proof checker: Lean and separate scripts perform the actual checks.

Its central commitments are concrete. Continuous scriptural context should accompany excerpts. Quotations should preserve traditional characters and locators. Commentary should be attributed rather than blended into the scripture. Missing connections should be discussed with the researcher. Doctrinal assumptions should remain visible as theorem parameters rather than hidden global axioms. Compilation, dependency inspection, and scope checks should be reported accurately. Research notes, code, and teaching explanations should describe the same selected argument.

The project's governing principle also limits the intended output: an argument may exclude a particular claim under stated conditions; the project does not attempt to define Buddha or tathāgatagarbha. Machine verification and the completion of religious practice are not identified.

The skill's intended value is procedural: making omissions easier to notice and work easier to resume. Whether an assistant follows the instructions remains an observable question. This case does not compare research with and without the skill and therefore cannot quantify its effect.

### 3. A workflow with distinct responsibilities

The five steps below move from source selection to a reviewable artifact. Interpretive objections may send the researcher back to an earlier step; the sequence is not a one-pass automation pipeline.

#### 3.1 Establish the textual unit

Begin with the complete exchange, not an isolated conclusion. Record the edition, fascicle, page-column-line location, and any normalization. In the present corpus, continuous passages were retained from a project-held CBETA transcription. Working commentary copies were indexed by physical PDF pages or document paragraphs. Such locators are useful for review but must not be mistaken for stable pagination in every edition.

AI can help retrieve passages, align versions, and propose summaries. The researcher must decide whether the selected context is adequate and whether a quotation or attribution is faithful. Modern commentary files need not be redistributed merely because they were consulted.

#### 3.2 Write the argument in ordinary language

Before introducing symbols, describe the proposed claim, the question directed against it, and the connection needed to reach a contradiction. Keep different senses of a word separate. In this case, “inside,” “contact,” “having a referent,” “form,” and “without attachment” could not be assigned one unexamined meaning across all seven exchanges.

A useful output is a small premise ledger. Each entry names the premise, its source or interpretive reason, and its status: explicit wording, commentary-supported reading, or researcher-supplied bridge. A short explanation should also state what the premise does not claim. For example, a particular model connecting outside location to disconnected knowing is not a universal law against interaction at a distance.

#### 3.3 Resolve objections before treating the code as evidence

The assistant proposes a reconstruction; the researcher tests it against the text and the intended question. A change in interpretation may require changing the theorem's target rather than merely repairing its proof. This is where human disagreement is productive: it determines whether the code represents the intended argument at all.

The stopping point for this stage is a clearly stated conditional claim, not agreement about every metaphysical question. Unresolved alternatives should remain listed. A proof can then be developed for a selected route without claiming that other routes have been dismissed.

#### 3.4 Encode and check the conditional

Translate the reviewed reconstruction into propositions and explicit hypotheses. Use descriptive names, but explain that names do not carry their intended semantics into the kernel. Avoid an assumption that simply restates the desired conclusion unless that is openly the object of study.

Compile the actual file, inspect theorem dependencies, and check for incomplete proofs. If a theorem reports no extra axioms, separately inspect its parameters: an empty axiom list does not mean that the theorem has no assumptions. A reader should be able to see the same bridge in the ordinary-language explanation, the Lean signature, and the premise ledger.

#### 3.5 Test scope and package the result

Attempt to satisfy the premises without contradiction. Remove a substantive premise and look for a countermodel. Check whether a stronger conclusion follows or remains unsupported. For finite propositional models, exhaustive enumeration is a modest and reproducible aid. It audits the formulas supplied to the script, so agreement between those formulas and the intended Lean model is another review obligation.

Finally, publish the layers together: passage and commentary references, explanation, explicit premises, source code, toolchain, checks, and scope statement. A teaching page can simplify presentation while retaining a way to inspect the assumptions. Every displayed proof status should correspond to an actual run on an identifiable source version.

### 4. A recorded revision: from independence to reified identification

The selected case record contains 18 visible dialogue messages: 5 user messages, 8 assistant progress messages, and 5 assistant final messages. It covers 3 October 2026, 10:16:59.731–11:22:41.772 UTC+08:00. These are timestamps in local session records, not independently certified delivery times. Tool payloads and internal reasoning are outside this dialogue transcript.

| Recorded time, UTC+08:00 | Research event | Consequence for the model |
|:--|:--|:--|
| 10:16:59 | The researcher asks whether one preliminary principle could replace separate premise packages | Introduces the shared-principle question |
| 10:22:02 | The assistant presents an independence-oriented proposal and bridge requirements | Makes a first candidate available for criticism |
| 10:55:00 | The researcher emphasizes dependence on contact in C5, conditional arising in C6, and separate existence despite nonlocation in C7 | Shows why causal independence is an unsuitable common characterization |
| 10:55:50 | The assistant revises the focus toward a separately posited mind | Changes the intended meaning of the shared predicate |
| 10:59:29–11:04:02 | Commentary evidence is requested and discussed | Connects the proposal to named interpretive sources |
| 11:06:33–11:07:42 | The researcher endorses the subject–object formulation and authorizes implementation | Establishes the selected reading for formal work |
| 11:22:41 | The assistant reports the proof and verification results | Delivers an inspectable conditional result |

**Table 1.** Selected events from the archived dialogue; the intervals do not measure isolated task durations or productivity.

This correction is substantive. A mind described as arising through conditions is not thereby causally independent of those conditions. The revised shared predicate concerns an act of reification: identifying a separately posited knower over against its objects as the mind-nature sought in the dialogue. The project then supplies one common exclusion and seven passage-specific bridges. A theorem proves that each description and its claimed identification cannot both hold under those assumptions.

The theorem does not refute the description alone. Recognizing this required a second separation: the contextual identification targeted by the shared layer is not automatically the same proposition as the claim in each existing local module. The implementation supplies a transfer theorem with an explicit connection premise. It does not silently replace the seven earlier proofs.

This sequence illustrates a feasible feedback path: textual objection → revised interpretation → revised predicates → precise conclusion → scope witnesses. It does not show that the AI independently discovered a Buddhist teaching. The recorded human contribution and the consulted commentaries are part of the explanation of how the formalization arose.

### 5. What the checks establish

The shared module contains 8 theorem declarations, including coverage, exclusion, transfer, and scope witnesses. For one chapter, `Description` means that the selected candidate account holds; `Separated` means that the account reifies a knower as separately subsisting over against its objects; and `Identifies` means that the candidate is correctly identified as the mind-nature sought in the dialogue. Ordinary functional distinctions alone do not establish `Separated`.

The basic exclusion uses two explicit premises:

```text
U: Separated → ¬ Identifies
B: Description → Separated
```

Together they imply `¬ (Description ∧ Identifies)`. Here `→` means implication, `¬` negation, and `∧` conjunction. Lean checks this conditional deduction; the textual interpretation still needs a defense.

The independent Boolean audit examines 8 assignments to these three propositions. Exactly 4 satisfy both U and B; none of those 4 satisfies `Description ∧ Identifies`. One satisfying assignment is `Description = true`, `Separated = true`, and `Identifies = false`. It retains the description while rejecting the identification. Further tests remove the common exclusion or one bridge, allowing the previously excluded identification. Across the seven chapters, 7 indexed omission witnesses show why the seven bridges remain individually necessary in this formulation.

To reproduce the enumeration, run `python tools/check_shared_nonduality.py` from the v1.0 repository root. The result is written to `audit/shared-nonduality-scope.json`. The accompanying verification guide maps the 8 declarations to their roles and lists the separate Lean build and dependency checks.

These checks address internal consistency, consequence, and dependence on selected assumptions. They do not establish the truth of a commentary, the best translation of a term, or the correctness of a doctrine. Nor do they make the project “assumption-free.” The assumptions have been made inspectable.

### 6. Recurrent failure modes and practical controls

| Failure mode | Observable control in the workflow |
|:--|:--|
| An AI paraphrase is treated as canonical wording | Retain the continuous passage and CBETA locator; compare quoted characters with the source and record any normalization |
| A commentary is presented as unanimous tradition | Record the commentator, work, fascicle or section, and page or paragraph locator; retain different emphases |
| An important premise is hidden in a predicate's label | Add a plain-language definition and an explicit bridge |
| A compilation result is mistaken for textual validation | Report proof status separately from interpretive status |
| A shared theorem silently changes the local target | State a transfer condition and preserve both formal layers |
| Inconsistent premises make a refutation trivial | Supply a satisfying model of the premise package |
| “No extra axioms” is reported as “no assumptions” | Inspect theorem parameters as well as axiom dependencies |
| A new extension is attributed to an older archive | Identify the released baseline and the local snapshot separately |

The controls are useful even when the proof is elementary. Their purpose is to maintain traceability through revisions, especially when the assistant produces several plausible explanations in succession. A record of rejected interpretations can explain a design decision; it should not be presented as evidence that every alternative interpretation has been exhausted.

### 7. Limitations and a research agenda

This is one project and one selected dialogue, not a controlled evaluation. The researcher participated in generating and assessing the interpretation. No independent panel scored fidelity, no baseline measured time saved, and no ablation isolated the contribution of the skill. The archive supports reconstruction of the visible process, not causal claims about AI effectiveness.

A subsequent study could give several readers the same scriptural unit, compare ordinary notes with a premise-ledger workflow, and ask whether they locate disagreements more precisely. Another study could compare different formalizations of the same passage without treating agreement as the only desirable outcome. These would require advance definitions of fidelity, usefulness, and adjudication procedures.

The immediate methodological lesson is narrower and usable now. Assign source verification, interpretation, proof checking, and publication judgment to distinct steps, and preserve the transitions between them. AI can assist across those steps; a written skill can remind it of the requirements; Lean can check a specified inferential claim. The researcher remains responsible for whether that claim is worth making about the text.

### Data availability and AI assistance

The [v1.0 release](https://github.com/1714065/surangama-formalization/releases/tag/v1.0) provides the seven local modules, the shared extension and public manuscripts. The full dialogue and skill snapshot remain in the author-held research archive and are not included in this public package. Claims about the recorded process can be examined through the reported excerpts and counts; the complete underlying dialogue is not publicly available. Public distribution of the full dialogue should be decided separately after review.

This report and its underlying workflow used AI assistance. Broader project records identify Claude and Codex; the selected dialogue and present drafting involve Codex. Exact model variants are not asserted from records that do not establish them. AI assisted in drafting; the author determines the interpretive framing and has reviewed and approved this public version.

### References

1. *Śūraṅgama Sūtra*, Chinese Taishō text T19, no. 945, fascicle 1, 0107a12–0108b14. [CBETA text](https://cbetaonline.dila.edu.tw/zh/T0945_001).
2. Wu, Jason. 2026. *Śūraṅgama Sūtra Argument Formalizations (Lean 4)*, v0.2.1. [doi:10.5281/zenodo.23108188](https://doi.org/10.5281/zenodo.23108188); [source repository](https://github.com/1714065/surangama-formalization). The shared extension is included in [v1.0](https://github.com/1714065/surangama-formalization/releases/tag/v1.0).
3. Fuenmayor, David, and Christoph Benzmüller. 2019. “A Computational-Hermeneutic Approach for Conceptual Explicitation.” [arXiv:1906.06582v2](https://arxiv.org/abs/1906.06582v2).
4. de Moura, Leonardo, and Sebastian Ullrich. 2021. “The Lean 4 Theorem Prover and Programming Language.” *Automated Deduction—CADE 28*, 625–635. [doi:10.1007/978-3-030-79876-5_37](https://doi.org/10.1007/978-3-030-79876-5_37).
5. Project research record. 2026. *七处征心：从共同前提探索到能所不二条件证明的对话实录*. Selected visible messages, 3 October, 10:16:59.731–11:22:41.772, UTC+08:00. Archive generated 3 October 2026, 03:54:16 UTC, as recorded in the JSON metadata. Author-held, non-public file: `dialogue.json`, with message hashes, source-line references, and a stated timestamp policy; not a public DOI archive.
6. Project workflow document. *sutra-argument-lean*, `SKILL.md`, and project references. Snapshot retained in the author-held research archive; not included in the public release. The snapshot records instructions, not an empirical validation of their effectiveness.
