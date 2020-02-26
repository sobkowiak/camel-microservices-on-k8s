#!/bin/bash

source setenv.sh

#kamel install
kamel install --operator-image=camelk/camel-k:1.0.0-RC2 \
  --maven-repository=https://repository.apache.org/content/repositories/orgapachecamel-1178 \
  --olm=false

# K8S_LOCAL_REGISTRY=`kubectl get svc -n kube-system registry -ojsonpath='{.spec.clusterIP}'` && \
# val="${K8S_LOCAL_REGISTRY}" && \
# kubectl -n knative-serving get cm config-deployment -oyaml \
#  | yq w - data.registriesSkippingTagResolving $val \
#  | kubectl apply -f -