#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.7.1/serving.yaml

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.11.0/serving.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml

echo "Waiting for Knative Serving to become ready"
sleep 5; while echo && kubectl get pods -n knative-serving | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done