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

module "cloud" {
  source = "./cloud"

  kubeconfig_path = var.kubeconfig_path
  api-key = var.api-key
  name = var.name
  region = var.region
}