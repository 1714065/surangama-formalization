<!-- SPDX-License-Identifier: CC0-1.0 -->

# Open problems and next steps

Recorded so that the repository does not overstate what it settles.

## Text and mapping

- **CBETA column locators** for the seven-location passage are unverified. Add them from a pinned CBETA XML commit, with the checksum recorded, as Ariake's library does for the Heart Sutra.
- **Three-commentary alignment.** Premises A01–A11c follow 圓瑛's outline. Where 成觀 or 宣化 read a move differently, record the divergence as a second premise set rather than choosing silently.
- **Project restatements.** A07a (the content of H4) and A11c (having a form entails being at one of the six places) are the project's formalizations, not quotations. Both should be tested against the commentaries and, if contested, given an alternative field.

## Premises and theories of perception

- A01 (H1) is a consequence of a presence principle (the mind knows what is where it is). The same principle stands behind A04 (H2, 眾僧食喻) and A05 (H3, 琉璃喻). The channel-principle audit done for H1 (`brainWorld`) has not yet been done for H2 and H3.
- The one-body/many-body argument (A09a–A09c) is used as a general premise in `L6_shortcut`; in the text it is argued under H5. Whether it may be read as general is an interpretive question.

## Logic

- `L4` uses excluded middle only because A07c is stated in the text's contrapositive form. A version of the whole module under a constructive or four-valued semantics has not been attempted.
- No name guard yet: theorem names cited in `README.md` and `docs/STATUS.md` are checked by hand. Port `check_names` from Ariake's tools.

## Scope

- Only the seven-location argument is covered. Candidate next units, in the order the project's issue register ranks them: the three refutations of the cognizing mind (三番破識), the ten displays of the seeing-essence (十番顯見, requiring the `R2` object as a first-class type), and the bell argument (擊鐘驗常) with input / perceptual state / capacity / report as four distinct variables.
- Science-side bridges (Bayesian perception, change of basis) are deliberately excluded from this repository because they need Mathlib and are modelling illustrations, not textual reconstructions.
