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


PROJECT="test"
PV_NAME="pv0001"
PVC_NAME="pvc0001"

echo "[INFO] Verifying PV: $PV_NAME"
oc get pv "$PV_NAME" || {
  log_error "PV $PV_NAME not found"
  exit 1
}

echo "[INFO] Verifying PVC: $PVC_NAME in namespace $PROJECT"
oc get pvc "$PVC_NAME" -n "$PROJECT" || {
  log_error "PVC $PVC_NAME not found in $PROJECT"
  exit 1
}

log_pass "NFS PV Verification passed"

