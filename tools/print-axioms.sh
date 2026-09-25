#!/bin/sh
# SPDX-License-Identifier: Apache-2.0
# Regenerate audit/lean-axioms.txt from the Audit module.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"
out=$(lake env lean lean/Surangama/SevenLocations/Audit.lean 2>&1)
stamp=$(date +%F)
toolchain=$(tr -d '\n' < lean-toolchain)
{
  printf '# Axiom-dependency report - %s - %s\n' "$toolchain" "$stamp"
  printf '# Regenerate: sh tools/print-axioms.sh (or tools\\print-axioms.ps1 on Windows)\n\n'
  printf '%s\n' "$out"
} > audit/lean-axioms.txt
echo "wrote audit/lean-axioms.txt"
