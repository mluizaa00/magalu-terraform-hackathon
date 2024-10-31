resource "secomp_hackathon_atesete_cluster" "cluster" {
  name                 = "ecommerce-service"
  version              = "v0.0.1"
  enabled_server_group = false
  description          = "ecommerce service application"
  provider = secomp
}

resource "secomp_hackathon_atesete_nodepool" "gp1_small" {
  depends_on   = [ secomp_hackathon_atesete_cluster.cluster ]
  name         = "apis-2cpu-4gb-20gb"
  cluster_id   = secomp_hackathon_atesete_cluster.cluster.id
  flavor_name  = "cloud-k8s.gp1.small"
  replicas     = 1
  min_replicas = 1
  max_replicas = 2
}