#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/eventing/releases/download/v0.7.1/release.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/eventing/releases/download/v0.11.0/release.yaml

watch  kubectl get pods --namespace knative-eventing
