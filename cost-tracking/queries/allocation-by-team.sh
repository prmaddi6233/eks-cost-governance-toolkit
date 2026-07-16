#!/usr/bin/env bash
# Cost allocation by the `team` label over the last 30 days, via the OpenCost /allocation API.
# This is the Kubernetes-side equivalent of the AWS "cost by team" query in
# aws-finops-analytics-pack — same attribution key, one mental model.
#
# Requires: a running OpenCost (port-forward svc/opencost 9003:9003) and jq.
#   OPENCOST_URL=http://localhost:9003 ./allocation-by-team.sh
set -euo pipefail

OPENCOST_URL="${OPENCOST_URL:-http://localhost:9003}"
WINDOW="${WINDOW:-30d}"

curl -sfG "${OPENCOST_URL}/allocation/compute" \
  --data-urlencode "window=${WINDOW}" \
  --data-urlencode "aggregate=label:team" \
  --data-urlencode "accumulate=true" \
  | jq -r '.data[] | to_entries[] | "\(.key)\t$\(.value.totalCost | (. * 100 | round / 100))"' \
  | sort -t'$' -k2 -nr
