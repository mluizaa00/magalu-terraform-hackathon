resource "kubernetes_persistent_volume_claim" "mongodb_pvc" {
  metadata {
    name      = "mongodb-pvc"
    namespace = "default"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}