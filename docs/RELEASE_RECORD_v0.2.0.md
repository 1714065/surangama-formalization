<!-- SPDX-License-Identifier: CC0-1.0 -->

# v0.2.0 publication record

Published 2026-10-03 (Asia/Shanghai); GitHub reports 2026-10-02T18:00:54Z.

- GitHub release: [v0.2.0](https://github.com/1714065/surangama-formalization/releases/tag/v0.2.0).
- Immutable release commit: `34986b79a012a75290fdaf3b76d4c2cc303c5b64`.
- CI before publication: [37044395776](https://github.com/1714065/surangama-formalization/actions/runs/37044395776), success on the exact release commit.
- Tag-push CI: [37044577434](https://github.com/1714065/surangama-formalization/actions/runs/37044577434), success on the same commit.
- Zenodo version DOI: [10.5281/zenodo.23107913](https://doi.org/10.5281/zenodo.23107913); record [23107913](https://zenodo.org/records/23107913), version `v0.2.0`, resource type Software.
- Version-family DOI: [10.5281/zenodo.22950552](https://doi.org/10.5281/zenodo.22950552), unchanged from the initial release.
- Archive: `1714065/surangama-formalization-v0.2.0.zip`, 114911 bytes.
- Archive MD5: `md5:71d2575869e7307839b453ae3f5c7744` (matches the Zenodo API).
- Archive SHA-256: `9154abd10c94284563780b4779c10098a21e598cf9862efe2f85c1eda96d6a6e`.
- All 48 tracked files match the output of `git archive --format=zip v0.2.0` byte for byte. The tracked `.gitattributes` exports PowerShell scripts with CRLF; this is an intentional line-ending conversion, not a source difference.

The archive contains all seven current proof modules, their 49 theorem
declarations, per-passage premise/source notes, the public Chinese research
guide with embedded source, and the portable scope-check script and report.
Historical Core proofs are preserved. CI ran Lean checking, the no-placeholder
gate, the axiom audit and the reproducible Boolean scope audit.

## Post-publication metadata

The version DOI could only be recorded after the GitHub–Zenodo integration
minted it. This record and the DOI additions to README/CITATION are a later
metadata commit on `main`; they do not move the `v0.2.0` tag or alter the
archived proofs. To reproduce this release, check out the tag above rather
than assuming the moving main branch is identical to the archive.

This is a formalization-software and supporting-research release, not a claim
of peer-reviewed journal publication or validation of interpretive premises.
