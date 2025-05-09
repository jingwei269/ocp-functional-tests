#!/bin/bash
set -euo pipefail

PROJECT="template-test"
REQUIRED_POLICIES=(
  "allow-from-openshift-ingress"
  "allow-from-openshift-monitoring"
  "allow-same-namespace"
)

# 检查默认模板是否存在
if oc get template project-request -n openshift-config >/dev/null 2>&1; then
  echo "[PASS] Default project template 'project-request' exists in openshift-config."
else
  echo "[FAIL] Default project template 'project-request' is missing in openshift-config."
  exit 1
fi


# 获取实际存在的 networkpolicies 名称
EXISTING_POLICIES=$(oc get networkpolicies -n "$PROJECT" -o jsonpath='{.items[*].metadata.name}')

ALL_FOUND=true
for POLICY in "${REQUIRED_POLICIES[@]}"; do
  if echo "$EXISTING_POLICIES" | grep -qw "$POLICY"; then
    echo "[PASS] Found required NetworkPolicy: $POLICY"
  else
    echo "[FAIL] Missing required NetworkPolicy: $POLICY"
    ALL_FOUND=false
  fi
done

if [ "$ALL_FOUND" = false ]; then
  echo "[FAIL] One or more required NetworkPolicies are missing."
  exit 1
else
  echo "[PASS] All required NetworkPolicies are present in project '$PROJECT'."
fi
