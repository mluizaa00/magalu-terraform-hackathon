locals {
  kubeconfig_path = var.kubeconfig_path
}

provider "kubernetes" {
  config_path = kubeconfig_path
}
