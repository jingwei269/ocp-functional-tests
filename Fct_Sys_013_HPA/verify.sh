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


PROJECT="my-hpa"

echo "[INFO] Sending load with ApacheBench..."
# 你需要安装 ab 工具 (httpd-tools)
ROUTE=$(oc get route pod-autoscale -n "$PROJECT" -o jsonpath='{@.spec.host}')
ab -n 100000 -c 1000 "https://$ROUTE/" || true

echo "[INFO] Waiting for HPA scale up..."
sleep 15

echo "[INFO] Checking HPA status:"
oc get hpa -n "$PROJECT"

REPLICAS=$(oc get hpa pod-autoscale -n "$PROJECT" -o jsonpath='{.status.currentReplicas}')
if [[ "$REPLICAS" -gt 1 ]]; then
  log_pass "HPA scaled to $REPLICAS replicas"
else
  log_error "HPA did not scale"
  exit 1
fi

