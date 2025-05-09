#!/bin/bash
set -euo pipefail

PROJECT="my-hpa"

echo "[INFO] Sending load with ApacheBench..."
# 你需要安装 ab 工具 (httpd-tools)
ROUTE=$(oc get route pod-autoscale -n "$PROJECT" -o jsonpath='{@.spec.host}')
ab -n 100000 -c 1000 "https://$ROUTE/" || true

echo "[INFO] Waiting for HPA scale up..."
sleep 60

echo "[INFO] Checking HPA status:"
oc get hpa -n "$PROJECT"

REPLICAS=$(oc get hpa pod-autoscale -n "$PROJECT" -o jsonpath='{.status.currentReplicas}')
if [[ "$REPLICAS" -gt 1 ]]; then
  echo "[PASS] HPA scaled to $REPLICAS replicas"
else
  echo "[FAIL] HPA did not scale"
  exit 1
fi

