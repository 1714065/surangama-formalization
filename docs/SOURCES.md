<!-- SPDX-License-Identifier: CC0-1.0 -->

# Sources and provenance

Four questions are kept apart:

1. **Did Lean accept the statement?** `lake build` answers this.
2. **Which passage motivated the statement?** This file and `sources/registry.json` record it.
3. **Does the formal predicate faithfully render the passage?** A scholarly judgment, recorded as `passage_aligned`, `work_level`, or `unverified`; never inferred from compilation.
4. **Are the premises true?** Not claimed. The project derives consequences and builds countermodels under explicit premises.

## Primary text

*Dà fódǐng shǒulèngyán jīng* 大佛頂首楞嚴經, Taishō shinshū daizōkyō vol. 19,
no. 945, ten fascicles. The seven-location argument is in fascicle 1.
Reference edition: CBETA, T19n0945. **Column locators for the seven-location
passage are `unverified` in v0.1.0** and will be added from the CBETA XML
(pinned commit) in a later version; no locator is filled from a search
snippet. The ancient text is in the public domain. The project does not
redistribute CBETA files.

## Adopted working locators

The `L…` numbers in `docs/STATUS.md` and the Lean docstrings are line numbers
in a project-internal plain-text extraction of one modern commentary:

- 圓瑛《大佛頂首楞嚴經講義》(Yuanying, *Lectures on the Śūraṅgama Sūtra*),
  extracted 2026-09-22 from a DOCX copy held by the project. The extraction
  interleaves sutra text and commentary; the claim table cites only lines
  that quote the sutra. The file is **not redistributed**; the numbering is a
  working locator, not an edition reference.

Two further commentaries were consulted for readings and are likewise not
redistributed: 成觀《大佛頂首楞嚴經義貫》 and 宣化《大佛頂首楞嚴經淺釋》.
Reading `R1` (the refuted mind is the object-directed cognizing mind) follows
圓瑛's science-outline (科判) of the passage as 三番破識, first 破妄識無處,
with the note that the seven items are 七番破處 rather than seven
"interrogations" (徵心).

## Source-status vocabulary

- `passage_aligned`: a specific passage is identified and the formal predicate is mapped to it clause by clause.
- `work_level`: the work or argument family is identified; the theorem-to-passage map is not complete.
- `unverified`: evidence for a locator or mapping is missing; recorded, never guessed.

In v0.1.0 the seven-location module is `work_level` with respect to the
Taishō text (fascicle identified, columns unverified) and `passage_aligned`
with respect to the project's working extraction (line numbers given).
