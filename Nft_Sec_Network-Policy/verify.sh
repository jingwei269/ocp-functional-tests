#!/bin/bash
set -e

# 引入日志工具
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
UTILS_PATH="$SCRIPT_DIR/../common/utils.sh"

if [[ -f "$UTILS_PATH" ]]; then
  source "$UTILS_PATH"
else
  echo "[ERROR] Cannot find utils.sh at $UTILS_PATH"
  exit 1
fi


echo "[INFO] Verifying intra-project communication success..."
oc project network-policy-2

POD=$(oc get pods -n network-policy-2 -lapp=network-policy-test -o jsonpath='{.items[0].metadata.name}')

echo "[INFO] Accessing same-project service..."
oc rsh "$POD" curl --max-time 5 http://network-policy-test.network-policy-2.svc.cluster.local:8080 | head -10

echo "[INFO] Accessing cross-project service, should fail..."
if oc rsh "$POD" curl --max-time 5 http://httpd.network-policy-1.svc.cluster.local:8080 ; then
  log_error "Cross-project traffic unexpectedly succeeded"
  exit 1
else
  log_pass "Cross-project traffic correctly denied"
fi

echo "[INFO] Creating NetworkPolicy to allow traffic from network-policy-2"

oc create -n network-policy-1 -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-network-policy-2
spec:
  podSelector:
    matchLabels:
      app: httpd
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: network-policy-2
    ports:
    - protocol: TCP
      port: 8080
EOF

echo "[INFO] Label namespace network-policy-2 for NetworkPolicy selector"
oc label namespace network-policy-2 name=network-policy-2 --overwrite

echo "[INFO] Accessing cross-project service again, should succeed now..."
if oc rsh "$POD" curl --max-time 5 http://httpd.network-policy-1.svc.cluster.local:8080 |head -n 10; then
  log_pass "Cross-project traffic succeeded after applying NetworkPolicy"
else
  log_error "Cross-project traffic still denied"
  exit 1
fi

