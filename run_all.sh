#!/bin/bash
set -uo pipefail

STAGE="${1:-}"

if [[ "$STAGE" != "deploy" && "$STAGE" != "verify" && "$STAGE" != "clean" ]]; then
  echo "Usage: $0 <deploy|verify|clean>"
  exit 1
fi

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$BASE_DIR/common/utils.sh" || true

LOG_DIR="$BASE_DIR/logs"
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="$LOG_DIR/${STAGE}_${TIMESTAMP}.log"

exec > >(tee -a "$LOG_FILE") 2>&1

log_info "========== Starting [$STAGE] tests at $TIMESTAMP =========="

declare -a TESTS=(
  "Fct_Sys_001_NodeTaintCheck"
  "Fct_Sys_002_DefaultTemplate"
  "Fct_Sys_004_AppDeploy"
  "Fct_Sys_005_Pod_Affinity"
  "Fct_Sys_007_Image_Registry"
  "Fct_Sys_011_NFS_PV"
  "Fct_Sys_013_HPA"
  "Nft_Sec_Network-Policy"
)

for test in "${TESTS[@]}"; do
  log_info "========== Running [$STAGE] for Test: $test =========="

  script="$BASE_DIR/$test/${STAGE}.sh"
  if [[ -x "$script" ]]; then
    log_info "[$STAGE] Executing $script"
    if "$script"; then
      log_info "[$STAGE] $test completed successfully"
    else
      log_error "[$STAGE] $test failed"
    fi
  else
    log_warn "[SKIP] No executable $script found"
  fi

  log_info "========== Finished [$STAGE] for Test: $test =========="
  echo
done

log_info "========== All [$STAGE] tests completed. Logs saved to $LOG_FILE =========="
