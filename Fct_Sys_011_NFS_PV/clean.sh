#!/bin/bash
set -euo pipefail

PROJECT="test"
PV_NAME="pv0001"
PVC_NAME="pvc0001"

echo "[INFO] Deleting PVC: $PVC_NAME in project $PROJECT"
oc delete pvc "$PVC_NAME" -n "$PROJECT" --ignore-not-found

echo "[INFO] Deleting PV: $PV_NAME"
oc delete pv "$PV_NAME" --ignore-not-found

# Optional: delete project (uncomment if needed)
echo "[INFO] Deleting project: $PROJECT"
oc delete project "$PROJECT" --ignore-not-found

