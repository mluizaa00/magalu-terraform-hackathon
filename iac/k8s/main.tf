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
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

module "deployments-plataforma" {
  source = "./deployments/plataforma"
}

module "sa" {
  source = "./sa"
}