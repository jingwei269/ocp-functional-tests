#!/bin/bash
set -euo pipefail

PROJECT="openshift"
IMAGESTREAM="rhel7-minimal"

echo "[INFO] Verifying ImageStream '$IMAGESTREAM' in project '$PROJECT'..."

if oc get is "$IMAGESTREAM" -n "$PROJECT" &>/dev/null; then
  echo "[PASS] ImageStream '$IMAGESTREAM' found."
  exit 0
else
  echo "[FAIL] ImageStream '$IMAGESTREAM' not found."
  exit 1
fi

