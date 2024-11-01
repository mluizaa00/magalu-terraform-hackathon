locals {
  cluster_name = var.cluster_name
}

resource "mgc_kubernetes_cluster" "secomp_atesete" {
  name                 = local.cluster_name
  version              = data.mgc_kubernetes_version.cluster_version.versions[0].version
  enabled_server_group = false
  description          = local.cluster_name
  provider             = mgc
}