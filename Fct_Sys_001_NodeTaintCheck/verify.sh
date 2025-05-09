#!/bin/bash
set -euo pipefail

NODES=$(oc get nodes |grep infra |awk '{ print $1}')
EXPECTED='[
  {
    "effect": "NoExecute",
    "key": "infra",
    "value": "reserved"
  },
  {
    "effect": "NoSchedule",
    "key": "infra",
    "value": "reserved"
  }
]'

ALL_PASS=true

for NODE in "${NODES[@]}"; do
  echo "[INFO] Checking taints for node: $NODE"

  ACTUAL=$(oc get node "$NODE" -o json | jq '.spec.taints')

  if echo "$ACTUAL" | jq -e --argjson exp "$EXPECTED" '(. == $exp)' >/dev/null; then
    echo "[PASS] $NODE: Node taints are correctly configured."
  else
    echo "[FAIL] $NODE: Taints do not match expected configuration."
    echo "Expected:"
    echo "$EXPECTED"
    echo "Actual:"
    echo "$ACTUAL"
    ALL_PASS=false
  fi
done

if [ "$ALL_PASS" = false ]; then
  echo "[FAIL] One or more nodes have incorrect taints."
  exit 1
else
  echo "[PASS] All nodes have correct taints."
fi
