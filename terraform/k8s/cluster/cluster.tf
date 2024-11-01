locals {
  cluster_name = var.cluster_name
}

resource "mgc_kubernetes_cluster" "cluster" {
  name                 = local.cluster_name
  version              = data.mgc_kubernetes_version.cluster_version.versions[0].version
  enabled_server_group = false
  description          = local.cluster_name
  provider             = mgc
}

data "mgc_kubernetes_cluster_kubeconfig" "cluster" {
  cluster_id = mgc_kubernetes_cluster.cluster.id
}

resource "local_file" "kubeconfig" {
  content  = data.mgc_kubernetes_cluster_kubeconfig.cluster.kubeconfig
  filename = "${path.module}/kubeconfig.yaml"
}