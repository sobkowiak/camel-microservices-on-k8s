#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.7.1/monitoring.yaml

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.11.0/monitoring.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/serving/releases/download/v0.12.0/monitoring.yaml

kubectl label nodes --all beta.kubernetes.io/fluentd-ds-ready="true"

echo "Waiting for Knative monitoring to become ready"
sleep 5; while echo && kubectl get pods -n knative-monitoring | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done