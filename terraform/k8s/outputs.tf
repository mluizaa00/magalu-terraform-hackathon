output "kubeconfig_path" {
  value = cluster.local_file.kubeconfig.filename
}