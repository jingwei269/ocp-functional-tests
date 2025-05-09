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



PROJECT="affinity-test"
echo "[INFO] Verifying pods distribution for project: $PROJECT"

 

echo "[INFO] Pods and their assigned nodes:"
pods=$(oc get pods -n "$PROJECT" -l app=httpd --field-selector=status.phase=Running -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.nodeName}{"\n"}')

# 确保 pods 保持原格式逐行处理
while IFS=$'\t' read -r pod node; do
  if [[ -n "$node" ]]; then
    zone=$(oc get node "$node" -o jsonpath='{.metadata.labels.topology\.kubernetes\.io/zone}')
    echo -e "$pod\t$node\t$zone"
  fi
done <<< "$pods"


zones=$(oc get pods -n "$PROJECT" -l app=httpd -o jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}' | xargs -n1 oc get node -o jsonpath='{.metadata.name}{"\t"}{.metadata.labels.topology\.kubernetes\.io/zone}{"\n"}' | cut -f2 | sort | uniq)

zone_count=$(printf "%s\n" "$zones" | wc -l)

if (( zone_count >= 2 )); then
  log_pass "Pods are distributed across at least two zones"
else
  log_error "Pods are not distributed across multiple zones"
  exit 1
fi

