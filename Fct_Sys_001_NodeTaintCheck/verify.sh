#!/bin/bash
set -euo pipefail

# 引入日志工具
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
UTILS_PATH="$SCRIPT_DIR/../common/utils.sh"

if [[ -f "$UTILS_PATH" ]]; then
  source "$UTILS_PATH"
else
  echo "[ERROR] Cannot find utils.sh at $UTILS_PATH"
  exit 1
fi

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

for NODE in $(oc get nodes |grep infra |awk '{ print $1}'); do
  log_info "Checking taints for node: $NODE"

  ACTUAL=$(oc get node "$NODE" -o json | jq '.spec.taints')

  if echo "$ACTUAL" | jq -e --argjson exp "$EXPECTED" '(. == $exp)' >/dev/null; then
    log_info "$ACTUAL"
    log_pass "$NODE: Node taints are correctly configured."
  else
    log_error "$NODE: Taints do not match expected configuration."
    echo "Expected:"
    echo "$EXPECTED"
    echo "Actual:"
    echo "$ACTUAL"
    ALL_PASS=false
  fi
done

if [ "$ALL_PASS" = false ]; then
  log_error "One or more nodes have incorrect taints."
  exit 1
else
  log_pass "All nodes have correct taints."
fi
