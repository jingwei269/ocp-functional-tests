#!/bin/bash
set -e

oc delete project network-policy-1 || true
oc delete project network-policy-2 || true

