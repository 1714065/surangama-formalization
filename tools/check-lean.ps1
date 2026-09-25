# SPDX-License-Identifier: Apache-2.0
# Sorry gate + full build. Fails if any 'sorry' appears in lean/ or the build fails.
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root
$sorries = Get-ChildItem -Recurse -Path "lean" -Filter "*.lean" | Select-String -Pattern "\bsorry\b"
if ($sorries) { $sorries | ForEach-Object { Write-Output $_.ToString() }; Write-Error "sorry found"; exit 1 }
& lake build
if ($LASTEXITCODE -ne 0) { Write-Error "lake build failed"; exit 1 }
Write-Output "check-lean OK: no sorry, build passed"
