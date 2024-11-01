locals {
  cluster_name = var.cluster_name
}

resource "mgc_kubernetes_cluster" "secomp_atesete" {
  name                 = local.cluster_name
  version              = mgc_kubernetes_version.versions[0].version
  enabled_server_group = false
  description          = local.name
  provider             = mgc
}