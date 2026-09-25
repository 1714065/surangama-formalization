#!/bin/sh
# SPDX-License-Identifier: Apache-2.0
#
# Reproduce every claim this repository makes, in one command:
#   sh verify.sh
# Steps: sorry gate -> lake build -> regenerate the axiom-dependency record.
set -eu
root=$(cd "$(dirname "$0")" && pwd)
cd "$root"

echo "=== 1/3 sorry gate"
if grep -rn --include='*.lean' -E '\bsorry\b' lean; then
  echo "sorry found" >&2
  exit 1
fi

echo "=== 2/3 lake build"
lake build

echo "=== 3/3 axiom-dependency record"
sh tools/print-axioms.sh

echo
echo "verify OK on $(date +%F): surangama-formalization reproduces its claims"
