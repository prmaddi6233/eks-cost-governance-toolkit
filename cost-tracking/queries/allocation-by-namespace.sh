#!/usr/bin/env bash
# Cost allocation by namespace over the last 7 days, via the OpenCost /allocation API.
#
# Requires: a running OpenCost (port-forward svc/opencost 9003:9003) and jq.
#   OPENCOST_URL=http://localhost:9003 ./allocation-by-namespace.sh
set -euo pipefail

OPENCOST_URL="${OPENCOST_URL:-http://localhost:9003}"
WINDOW="${WINDOW:-7d}"

curl -sfG "${OPENCOST_URL}/allocation/compute" \
  --data-urlencode "window=${WINDOW}" \
  --data-urlencode "aggregate=namespace" \
  --data-urlencode "accumulate=true" \
  | jq -r '.data[] | to_entries[] | "\(.key)\t$\(.value.totalCost | (. * 100 | round / 100))"' \
  | sort -t'$' -k2 -nr
