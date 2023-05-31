variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kube_config)
    # Below is for explicit configuration, per provider documentation - use if different from local config
    # Configured for my local cluster, so change it to match your setup
    # host     = "https://192.168.49.2:8443"
    # client_certificate     = file("/home/david/.minikube/profiles/minikube/client.crt")
    # client_key             = file("/home/david/.minikube/profiles/minikube/client.key")
    # cluster_ca_certificate = file("/home/david/.minikube/ca.crt")
  }
}

# Source: https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release#example-usage---local-chart
# Note it may take a while for the deployment to finish because of the initialDelaySeconds in the chart
resource "helm_release" "devops-helm" {
  name       = "devops-helm"
  chart      = "../devops-helm"
}