#!/bin/bash
set -e

oc new-project network-policy-1   >/dev/null
oc new-project network-policy-2   >/dev/null

# 部署 httpd 到 network-policy-1
oc create -n network-policy-1 -f - <<EOF
apiVersion: apps.openshift.io/v1
kind: DeploymentConfig
metadata:
  name: httpd
spec:
  selector:
    app: httpd
  replicas: 1
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
      - name: httpd
        image: rhscl/httpd-24-rhel7
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: httpd
spec:
  selector:
    app: httpd
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
EOF

# 部署 network-policy-test 到 network-policy-2
oc create -n network-policy-2 -f - <<EOF
apiVersion: apps.openshift.io/v1
kind: DeploymentConfig
metadata:
  name: network-policy-test
spec:
  selector:
    app: network-policy-test
  replicas: 1
  template:
    metadata:
      labels:
        app: network-policy-test
    spec:
      containers:
      - name: network-policy-test
        image: rhscl/httpd-24-rhel7
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: network-policy-test
spec:
  selector:
    app: network-policy-test
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
EOF

