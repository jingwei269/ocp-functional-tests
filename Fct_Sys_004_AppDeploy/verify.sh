#!/bin/bash
set -euo pipefail

PROJECT="test"
APP_NAME="httpd-24-rhel7"
ROUTE_HOST=""

# 等待 Route 准备好
echo "[INFO] Waiting for route to be created..."
for i in {1..10}; do
  ROUTE_HOST=$(oc get route "$APP_NAME" -n "$PROJECT" -o jsonpath='{.spec.host}' 2>/dev/null || true)
  if [[ -n "$ROUTE_HOST" ]]; then
    echo "[INFO] Route found: $ROUTE_HOST"
    break
  fi
  echo "[INFO] Route not ready yet. Retrying... ($i)"
  sleep 5
done

if [[ -z "$ROUTE_HOST" ]]; then
  echo "[FAIL] Route was not created within timeout."
  exit 1
fi

echo "[INFO] Verifying route with curl..."
if curl -s "https://$ROUTE_HOST" -k | grep -iq "apache"; then
  echo "[PASS] Application is deployed and accessible via route."
else
  echo "[FAIL] Application route did not return expected content."
  exit 1
fi
