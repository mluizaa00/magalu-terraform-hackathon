locals {
  name = var.name
}

resource "mgc_kubernetes_cluster" "secomp_atesete" {
  name                 = local.name
  version              = mgc_kubernetes_version.versions[0].version
  enabled_server_group = false
  description          = local.name
  provider             = mgc
}

resource "mgc_kubernetes_nodepool" "secomp_atesete_small" {
  depends_on   = [ mgc_kubernetes_cluster.secomp_atesete ] 
  name         = local.name
  cluster_id   = mgc_kubernetes_cluster.secomp_atesete.id 
  flavor_name  = kubernetes_flavor.flavors[0].name
  replicas     = 1
  min_replicas = 1
  max_replicas = 2
}
