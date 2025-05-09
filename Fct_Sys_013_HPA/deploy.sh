#!/bin/bash
set -euo pipefail

PROJECT="my-hpa"
oc new-project "$PROJECT" >/dev/null

# Remove limitrange from template 
oc delete limitrange cpu-mem-limit-bound -n "$PROJECT"

# 创建 LimitRange
cat <<EOF | oc create -f - -n "$PROJECT"
apiVersion: v1
kind: LimitRange
metadata:
  name: limits
spec:
  limits:
  - type: Pod
    max:
      cpu: 100m
      memory: 750Mi
    min:
      cpu: 10m
      memory: 5Mi
  - type: Container
    max:
      cpu: 100m
      memory: 750Mi
    min:
      cpu: 10m
      memory: 5Mi
    default:
      cpu: 50m
      memory: 100Mi
EOF

# 部署 workload
oc new-app quay.io/gpte-devops-automation/pod-autoscale-lab:rc0 --name=pod-autoscale -n "$PROJECT" >/dev/null
oc create route edge pod-autoscale --service=pod-autoscale --port=8080 -n "$PROJECT"



# 配置 autoscaler
oc autoscale deploy/pod-autoscale --min 1 --max 5 --cpu-percent=80 -n "$PROJECT"

