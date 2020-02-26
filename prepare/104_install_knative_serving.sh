#!/bin/bash

source setenv.sh

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.7.1/serving.yaml

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/serving/releases/download/v0.11.0/serving.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml

watch kubectl get pods --namespace knative-serving
