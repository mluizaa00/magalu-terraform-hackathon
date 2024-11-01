terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
      version = "0.27.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}

module "k8s" {
  source = "./k8s"
}

module "providers" {
  source = "./providers"
  kubeconfig_path = module.k8s.kubeconfig_path
}