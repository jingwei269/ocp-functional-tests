#!/bin/bash
set -euo pipefail

PROJECT="test"

echo "[INFO] Creating project: $PROJECT"
oc new-project "$PROJECT" >/dev/null

echo "[INFO] Deploying application using OpenShift httpd image"

oc new-app registry.redhat.io/rhscl/httpd-24-rhel7  -n "$PROJECT" >/dev/null

echo "[INFO] Creating edge route for the httpd service"
oc create route edge --service=httpd-24-rhel7 -n "$PROJECT"



