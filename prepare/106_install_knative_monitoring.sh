#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.7.1/monitoring.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/serving/releases/download/v0.11.0/monitoring.yaml

kubectl label nodes --all beta.kubernetes.io/fluentd-ds-ready="true"

watch kubectl get pods --namespace knative-monitoring