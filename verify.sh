#!/bin/sh
# SPDX-License-Identifier: Apache-2.0
#
# Reproduce every claim this repository makes, in one command:
#   sh verify.sh
# Steps: sorry gate -> lake build -> axiom record -> propositional scope.
set -eu
root=$(cd "$(dirname "$0")" && pwd)
cd "$root"

echo "=== 1/4 sorry gate"
if grep -rn --include='*.lean' -E '\bsorry\b' lean; then
  echo "sorry found" >&2
  exit 1
fi

echo "=== 2/4 lake build"
lake build

echo "=== 3/4 axiom-dependency record"
sh tools/print-axioms.sh

echo "=== 4/4 propositional scope audit (Python 3)"
python3 tools/check_scope.py

echo
echo "verify OK on $(date +%F): surangama-formalization reproduces its claims"
