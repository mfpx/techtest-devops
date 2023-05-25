# DevOps Tech Test - Helloworld

## Introduction

This is a simple helloworld application for DevOps tech test, written in Go version `1.16`  
The application listens on port `1337` by default.

## Endpoints
Following are the endpoints available.
```
/
/healthz
/greetings
```

## Tasks

There is no time limit for this exercise, however we would recommend you aim to complete the exercise in 2-3 hours.  
Once you are happy with your solution, commit and push your work back up to this repository in a branch named `solution`.  
Please commit your work in a way that each task can be easily identified in the commit history and cherry-picked.  
The work we want committed should be enough for us to independently repeat your results.  

Please do not make any code change to the helloworld application itself, but you are free to install applications on
Kubernetes that may help you to complete task #3 and #4.

1. Create a single Dockerfile to build and run the application into a deployable container image.  
   The final image should only contain the application binary.

2. Setup and run a single node Kubernetes either locally or on a local VM.  
   Please document or script the approach you have taken so we can repeat it.

3. You have a choice:  
   3a. Create a [Helm chart](https://helm.sh/) for helloworld  
   **OR**  
   3b. Create a [Kustomization](https://kustomize.io/) for helloworld

   Regardless of what you choose, the application should be:
      * Highly available
      * Accessible publicly through an ingress
      * Configured so that kubelet knows:
        * when a container is ready to start accepting traffic
        * when a container is in an unhealthy state and needs to be restarted

4. Use Terraform, and the [Terraform Helm Provider](https://registry.terraform.io/providers/hashicorp/helm) 
   or the [Terraform Kubernetes Provider](https://registry.terraform.io/providers/hashicorp/kubernetes/) respectively, 
   to deploy your Helm chart into your Kubernetes instance.  
   Ensure you can request the `/greetings` endpoint from outside your Kubernetes instance and receive a response.

5. The application endpoint `/greetings` looks for an environment variable named `CANDIDATE_FIRSTNAME` 
   in order to display the message properly.  
   Update your chart or deployment to set this environment variable to your first name so the page shows something like

   ```
   Hello xxx, welcome to Hello World!
   ```

Please include some guidance on how to repeat your results, if necessary.

Good luck!