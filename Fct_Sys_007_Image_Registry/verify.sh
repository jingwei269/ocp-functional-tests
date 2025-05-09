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



PROJECT="openshift"
IMAGESTREAM="rhel7-minimal"

echo "[INFO] Verifying ImageStream '$IMAGESTREAM' in project '$PROJECT'..."

if oc get is "$IMAGESTREAM" -n "$PROJECT" &>/dev/null; then
  log_pass "ImageStream '$IMAGESTREAM' found."
  exit 0
else
  log_error "ImageStream '$IMAGESTREAM' not found."
  exit 1
fi

