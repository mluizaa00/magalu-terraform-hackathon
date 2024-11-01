locals {
  kubernates-host = var.kubernates-host
  kubernates-client-certificate = var.kubernates-client-certificate
}

provider "kubernetes" {
  host                   = local.kubernates-host
  cluster_ca_certificate = base64decode(local.kubernates-client-certificate)
  token                  = output.k8s_service_account_token              
}
