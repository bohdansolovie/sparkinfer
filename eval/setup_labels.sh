#!/usr/bin/env bash
# One-time: create the eval:* labels the PR bot applies. Idempotent (--force upserts).
#   eval/setup_labels.sh [owner/repo]
set -euo pipefail
REPO="${1:-gittensor-ai-lab/sparkinfer}"
declare -A C=( [XL]=0E8A16 [L]=1D76DB [M]=5319E7 [S]=FBCA04 [XS]=BFD4F2
               [none]=C5DEF5 [REJECT]=B60205 [BASELINE]=D4C5F9 )
for k in "${!C[@]}"; do
  gh label create "eval:$k" -R "$REPO" --color "${C[$k]}" \
     --description "sparkinfer auto-eval verdict: $k" --force >/dev/null
done
echo "eval:* labels ready on $REPO"
