#!/bin/bash

# Ensure the current shell is pointing to minikube's docker repo
# Running the script spawns a new shell instance, so this has to be here
eval "$(minikube -p minikube docker-env)"

if [[ -d techtest-devops-mfpx/.git ]];
then
    # Pull changes - might prompt for password depending on local config
    echo Repo already exists, will pull for latest changes
    cd techtest-devops-mfpx && git pull && cd ..
else
    # Grab the repo
    git clone git@github.com:w3w-internal/techtest-devops-mfpx.git
fi

# Check if Dockerfile exists
if [[ -f Dockerfile ]];
then
    echo Dockerfile present, continuing
else
    echo Dockerfile not present, exiting
    exit 1
fi

# Check if dockerd is running - only works with systemd
if [[ $(systemctl show --property ActiveState docker) = "ActiveState=active" ]];
then
    echo Docker is running, continuing
else
    echo Docker is not running, exiting
    exit 1
fi

# Build the docker image
docker build -t devops-helm .