#!/bin/bash
set -euo pipefail

PROJECT="template-test"

# 创建测试项目（如果已存在则跳过）
if ! oc get project "$PROJECT" >/dev/null 2>&1; then
  oc new-project "$PROJECT" >/dev/null
else
  echo "[INFO] Project '$PROJECT' already exists, skipping creation."
fi
