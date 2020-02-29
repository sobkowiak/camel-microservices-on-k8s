#!/bin/bash

source setenv.sh

PROFILE_NAME=${PROFILE_NAME:-knativetutorial}
#MEMORY=${MEMORY:-8192}
MEMORY=${MEMORY:-20000}
#CPUS=${CPUS:-6}
CPUS=${CPUS:-8}

EXTRA_CONFIG="apiserver.enable-admission-plugins=\
LimitRanger,\
NamespaceExists,\
NamespaceLifecycle,\
ResourceQuota,\
ServiceAccount,\
DefaultStorageClass,\
MutatingAdmissionWebhook"


minikube config set profile $PROFILE_NAME
#minikube config set vm-driver virtualbox
#minikube config set cpus 5
#minikube config set memory 10240
#minikube config set disk-size 50g
#minikube config set kubernetes-version $KUBERNETES_VERSION

minikube start -p $PROFILE_NAME \
  --memory=$MEMORY \
  --cpus=$CPUS \
  --kubernetes-version=$KUBERNETES_VERSION \
  --vm-driver=kvm2 \
  --disk-size=50g \
  --extra-config="$EXTRA_CONFIG" \
  --insecure-registry='10.0.0.0/24'

sleep 5; while echo && kubectl get pods -n kube-system  | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done

minikube profile $PROFILE_NAME

minikube -p $PROFILE_NAME addons enable registry
#minikube -p knative addons enable dashboard

echo "Waiting for registry to become ready"
sleep 5; while echo && kubectl get pods -n kube-system | grep registry | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done

minikube kubectl > /dev/null 2>&1;

