#!/bin/bash

source setenv.sh

echo "Deploying registry helper"
kubectl apply -n kube-system -f minikube/registry-aliases-config.yaml
kubectl apply -n kube-system -f minikube/node-etc-hosts-update.yaml
sleep 5; while echo && kubectl get pods -n kube-system  | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done
minikube ssh -- sudo cat /etc/hosts
kubectl get svc registry -n kube-system

echo "Updating CoreDNS"
./minikube/patch-coredns.sh
#kubectl get cm -n kube-system coredns -o yaml

