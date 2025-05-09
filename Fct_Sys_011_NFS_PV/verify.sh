#!/bin/bash
set -euo pipefail

PROJECT="test"
PV_NAME="pv0001"
PVC_NAME="pvc0001"

echo "[INFO] Verifying PV: $PV_NAME"
oc get pv "$PV_NAME" || {
  echo "[ERROR] PV $PV_NAME not found"
  exit 1
}

echo "[INFO] Verifying PVC: $PVC_NAME in namespace $PROJECT"
oc get pvc "$PVC_NAME" -n "$PROJECT" || {
  echo "[ERROR] PVC $PVC_NAME not found in $PROJECT"
  exit 1
}

echo "[INFO] Verification passed"

