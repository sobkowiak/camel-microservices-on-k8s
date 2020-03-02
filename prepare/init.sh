#!/bin/bash

source setenv.sh

source <(kubectl completion bash)
source <(minikube completion bash)
source <(kn completion bash)
source <(kamel completion bash)
source <(minikube docker-env)
