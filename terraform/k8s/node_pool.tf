locals {
  node_pool_name = var.node_pool_name
}

resource "mgc_kubernetes_nodepool" "secomp_atesete" {
  depends_on   = [ mgc_kubernetes_cluster.secomp_atesete ] 
  name         = local.node_pool_name
  cluster_id   = mgc_kubernetes_cluster.secomp_atesete.id 
  flavor_name  = "cloud-k8s.gp1.small"
  replicas     = 1
  min_replicas = 1
  max_replicas = 1
}
