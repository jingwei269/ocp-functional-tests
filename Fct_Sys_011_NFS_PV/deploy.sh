#!/bin/bash
set -euo pipefail

PROJECT="test"
PV_NAME="pv0001"
PVC_NAME="pvc0001"
NFS_SERVER="172.26.99.201"
NFS_PATH=" /aaocppv"

echo "[INFO] Creating project: $PROJECT (ignore if exists)"
oc new-project "$PROJECT" >/dev/null 2>&1 || true

echo "[INFO] Creating PersistentVolume: $PV_NAME"
cat <<EOF | oc create -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $PV_NAME
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteMany
  nfs:
    path: $NFS_PATH
    server: $NFS_SERVER
  persistentVolumeReclaimPolicy: Retain
EOF

echo "[INFO] Creating PersistentVolumeClaim: $PVC_NAME in project $PROJECT"
cat <<EOF | oc create -n "$PROJECT" -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: $PVC_NAME
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 5Gi
  volumeName: $PV_NAME
EOF

