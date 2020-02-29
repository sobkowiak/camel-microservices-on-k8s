#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/eventing/releases/download/v0.7.1/release.yaml

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/eventing/releases/download/v0.11.0/release.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/eventing/releases/download/v0.12.0/eventing.yaml

echo "Waiting for Knative Eventing to become ready"
sleep 5; while echo && kubectl get pods -n knative-eventing | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done