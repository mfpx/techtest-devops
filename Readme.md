# Introduction
Firstly, thank you for giving me an opportunity to do this task, and not only test myself, but to also show my knowledge.  
I had a tonne of fun doing these tasks and refreshing my knowledge on specifics

# Setup
My environment was as follows:  
* Ubuntu Server 22.04.2
  * Bridged networking
  * Nested virtualisation
  * 8 GB Memory
  * 4 CPU Cores
* Docker engine version 23.0.2
* Kubernetes version 1.26.3
  * Minikube version 1.30.1
* Helm version 3.12.0
* Terraform version 1.4.5
  
First, I installed **Docker**, following instructions on their website, found [here](https://docs.docker.com/engine/install/ubuntu/).  
Next, we need to install **minikube** I simply followed instructions on their setup guide. It's accessible [here](https://minikube.sigs.k8s.io/docs/start/).  
  
Once the two core parts are installed, we can install optional tools; although **minikube** comes with kubectl, I wanted to install the standalone tool.  
This can be achieved by following the instructions [here](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/).  
Now, we need to install helm for upcoming tasks. To do this, we can follow the instructions [here](https://helm.sh/docs/intro/install/).  
Lastly, Ubuntu's repositories contain the **Terraform** binary, so we can run `sudo apt install terraform -y`. Alternatively, we can download the binary  
directly from **Terraform**'s website, and use it.
  
The bulk of setup is done, and we now have several installation packages. We can remove them, as they're not needed, and take up valuable space.

# Task 1
For task 1, I created a simple Dockerfile. It just copies over some files (or clones a repository), then compiles the application and removes the source.  
The easiest way to do this, is to use `build.sh` included.
> If you decide to clone the repository, you'll need to copy your private key to the same directory where `Dockerfile` lives.  
> Otherwise the image build will fail due to a missing file. By default, `Dockerfile` specifies `id_rsa` as the private key,  
> but you can change this to whatever your key is called. Alternatively, you can provide an absolute path to the key instead.

# Task 2 & 3
I have combined tasks 2 and 3 into one step, because the **Kubernetes** setup was done at the beginning, rendering this step obsolete.  
I settled on using **minikube**, as I have used it previously, therefore I am familiar with how it works locally.  
  
Once I have created my blank **Helm** shart using `helm create devops-helm`, I have edited several files. The two main files were `templates/deployment.yaml` and `values.yaml`.  
To check that everything works, I have used `helm install devops-helm .` to install the chart. This should deploy 2 pods, and an ingress. I have created a `deploy.sh` script to avoid having to write the command every time, so you can just use that instead.  
> You may get `ErrImageNeverPull`. If this is the case, you can run `eval $(minikube-registry)` from the chart directory. This will configure environment variables to point to **minikube**'s internal **Docker** registry.  
> After doing the aforementioned, simply redeploy the chart.  
  
Everything should be functional now, and the deployment should be accessible outside of **Kubernetes** through the **Nginx ingress controller** that comes with **minikube**.  
To check this quickly, you can run `./pod-curl` from the chart directory. As we are running Kubernetes inside a virtual machine, you can only access resources _within_ it.  
You can, of course, configure to make everything accessible outside said virtual machine, but I think this is outside the scope of this task.  
  
Lastly, I ran into some issues when configuring **horizontal pod scaling**. This seemed to have been a **minikube** issue, as I have found some bug reports related to the issue.  
To somewhat combat this, I have set the deployment to create 2 replicas instead. Although not "highly available", it should be enough for this task.  

# Task 4
I have used HashiCorp's own **Helm** provider for **Terraform**. This then deploys to my local cluster using **minikube**'s configuration file in `.kube` directory.

# Task 5
For this task, I simply edited `templates/deployment.yaml` to include the environment variable `CANDIDATE_FIRSTNAME` and set it to my name as requested.  
You can use `pod-curl greetings` to see this. It will pass the first argument to `cURL` as a path.