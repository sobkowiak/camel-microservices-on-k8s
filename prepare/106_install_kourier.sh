#!/bin/bash

source setenv.sh



kubectl apply \
  --filename https://raw.githubusercontent.com/knative/serving/v0.12.0/third_party/kourier-latest/kourier.yaml

echo "Waiting for Kourier to become ready"
sleep 5; while echo && kubectl get pods -n kourier-system | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done