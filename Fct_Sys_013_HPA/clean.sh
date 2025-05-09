#!/bin/bash
set -euo pipefail

PROJECT="my-hpa"
oc delete project "$PROJECT" || true

