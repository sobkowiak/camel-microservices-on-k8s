#!/bin/bash

source setenv.sh

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: knativetutorial
EOF

kubens knativetutorial

kubectl apply -f minikube/nexus.yml