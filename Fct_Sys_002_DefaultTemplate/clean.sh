#!/bin/bash
set -euo pipefail

PROJECT="template-test"

if oc get project "$PROJECT" >/dev/null 2>&1; then
  echo "[INFO] Deleting project $PROJECT"
  oc delete project "$PROJECT"
else
  echo "[INFO] Project $PROJECT does not exist, nothing to clean."
fi