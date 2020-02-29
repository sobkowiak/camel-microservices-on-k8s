#!/bin/bash

export WKS_HOME=/home/ksobkowiak/work/ttseiii
export SOFTWARE_BASE=/home/ksobkowiak/work/ttseiii/soft-knative
export GRAALVM_HOME=/home/ksobkowiak/work/ttseiii/soft-knative/jvm/graalvm-ce

export MINIKUBE_VERSION=1.7.3
export KUBERNETES_VERSION=v1.17.3
export MINIKUBE_HOME=/home/ksobkowiak/work/ttseiii/soft-knative/minikube-1.7.3
export KUBECTL_PATH=$MINIKUBE_HOME/.minikube/cache/$KUBERNETES_VERSION
#export KUBE_EDITOR="vim"
export KUBECONFIG=/home/ksobkowiak/work/ttseiii/soft-knative/minikube-1.7.3/.kube/config
export HELM_HOME=/home/ksobkowiak/work/ttseiii/soft-knative/minikube-1.7.3/.helm

export ISTIO_VERSION=1.3.6

export PATH=$GRAALVM_HOME/bin:$SOFTWARE_BASE/bin:$KUBECTL_PATH:$PATH
