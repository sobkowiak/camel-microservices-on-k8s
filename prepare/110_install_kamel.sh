#!/bin/bash

source setenv.sh

kubectl create configmap camel-k-maven-settings --from-file=settings.xml=minikube/settings.xml

kamel install --maven-settings=configmap:camel-k-maven-settings/settings.xml \
  --olm=false

# kamel install --operator-image=camelk/camel-k:1.0.0-RC2 \
#  --maven-repository=https://repository.apache.org/content/repositories/orgapachecamel-1178 \
#  --olm=false

K8S_LOCAL_REGISTRY=`kubectl get svc -n kube-system registry -ojsonpath='{.spec.clusterIP}'` && \
val="${K8S_LOCAL_REGISTRY}" && \
kubectl -n knative-serving get cm config-deployment -oyaml \
 | yq w - data.registriesSkippingTagResolving $val \
 | kubectl apply -f -

watch kubectl get pods --namespace knativetutorial