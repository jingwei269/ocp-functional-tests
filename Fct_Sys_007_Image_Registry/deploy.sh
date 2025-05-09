#!/bin/bash
set -euo pipefail

PROJECT="openshift"
IMAGE_NAME="rhel7-minimal"
SOURCE_IMAGE="registry.access.redhat.com/rhel7-minimal"

echo "[INFO] Importing image '$IMAGE_NAME' from '$SOURCE_IMAGE' into project '$PROJECT'..."
oc import-image "$IMAGE_NAME" --confirm --from="$SOURCE_IMAGE" -n "$PROJECT"
echo "[INFO] Image import initiated."

