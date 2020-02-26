#!/bin/bash

source setenv.sh

# kubectl apply --selector knative.dev/crd-install=true \
#   --filename https://github.com/knative/serving/releases/download/v0.11.0/serving.yaml \
#   --filename https://github.com/knative/eventing/releases/download/v0.11.0/release.yaml \
#   --filename https://github.com/knative/serving/releases/download/v0.11.0/monitoring.yaml

kubectl apply --selector knative.dev/crd-install=true \
  --filename https://github.com/knative/serving/releases/download/v0.12.0/serving.yaml \
  --filename https://github.com/knative/eventing/releases/download/v0.12.0/eventing.yaml \
  --filename https://github.com/knative/serving/releases/download/v0.12.0/monitoring.yaml