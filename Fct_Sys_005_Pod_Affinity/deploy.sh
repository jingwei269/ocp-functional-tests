#!/bin/bash
set -euo pipefail

PROJECT="affinity-test"

echo "[INFO] Creating project: $PROJECT"
oc new-project "$PROJECT"  >/dev/null 

echo "[INFO] Deploying httpd application with podAntiAffinity"
oc create -n "$PROJECT" -f - <<EOF
apiVersion: apps.openshift.io/v1
kind: DeploymentConfig
metadata:
  name: affinity-test
spec:
  selector:
    app: httpd
  replicas: 4
  template:
    metadata:
      labels:
        app: httpd
    spec:
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 100
            podAffinityTerm:
              labelSelector:
                matchExpressions:
                - key: app
                  operator: In
                  values:
                  - httpd
              topologyKey: topology.kubernetes.io/zone
      containers:
      - name: httpd
        image: registry.redhat.io/rhscl/httpd-24-rhel7
        ports:
        - containerPort: 8080
EOF

