# SPDX-License-Identifier: Apache-2.0
# Regenerate audit/lean-axioms.txt from the Audit module.
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root
$out = & lake env lean "lean\Surangama\SevenLocations\Audit.lean" 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) { Write-Error "lean failed`n$out"; exit 1 }
$stamp = Get-Date -Format "yyyy-MM-dd"
$toolchain = (Get-Content "$root\lean-toolchain").Trim()
$header = "# Axiom-dependency report - $toolchain - $stamp`n# Regenerate: tools\print-axioms.ps1 (Windows) or sh tools/print-axioms.sh`n`n"
$out = $out -replace "`r`n", "`n"
[IO.File]::WriteAllText("$root\audit\lean-axioms.txt", $header + $out, (New-Object Text.UTF8Encoding $false))
Write-Output "wrote audit\lean-axioms.txt"
