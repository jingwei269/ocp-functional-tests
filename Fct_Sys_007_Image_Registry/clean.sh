#!/bin/bash
set -euo pipefail

PROJECT="openshift"
IMAGE_NAME="rhel7-minimal"

echo "[INFO] Deleting ImageStream '$IMAGE_NAME' from project '$PROJECT'..."
oc delete is "$IMAGE_NAME" -n "$PROJECT" --ignore-not-found
echo "[INFO] Cleanup complete."

