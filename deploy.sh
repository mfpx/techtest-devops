#!/bin/bash

# Ensure the current shell is pointing to minikube's docker repo
# Running the script spawns a new shell instance, so this has to be here
eval "$(minikube -p minikube docker-env)"

if type "helm" > /dev/null;
then
    helm install devops-helm .
else
    echo "Helm doesn't seem to exist"
fi