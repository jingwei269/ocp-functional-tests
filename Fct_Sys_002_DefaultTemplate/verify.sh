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


PROJECT="template-test"
REQUIRED_POLICIES=(
  "allow-from-openshift-ingress"
  "allow-from-openshift-monitoring"
  "allow-same-namespace"
)

# 检查默认模板是否存在
if oc get template project-request -n openshift-config >/dev/null 2>&1; then
  log_pass "Default project template 'project-request' exists in openshift-config."
else
  log_error "Default project template 'project-request' is missing in openshift-config."
  exit 1
fi


# 获取实际存在的 networkpolicies 名称
EXISTING_POLICIES=$(oc get networkpolicies -n "$PROJECT" -o jsonpath='{.items[*].metadata.name}')

ALL_FOUND=true
for POLICY in "${REQUIRED_POLICIES[@]}"; do
  if echo "$EXISTING_POLICIES" | grep -qw "$POLICY"; then
    log_pass "Found required NetworkPolicy: $POLICY"
  else
    log_error "Missing required NetworkPolicy: $POLICY"
    ALL_FOUND=false
  fi
done

if [ "$ALL_FOUND" = false ]; then
  log_error "One or more required NetworkPolicies are missing."
  exit 1
else
  log_pass "All required NetworkPolicies are present in project '$PROJECT'."
fi
