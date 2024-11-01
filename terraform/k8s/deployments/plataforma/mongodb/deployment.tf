resource "kubernetes_deployment" "mongodb" {
  metadata {
    name      = "mongodb"
    namespace = "default"
    labels = {
      app = "mongodb"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "mongodb"
      }
    }
    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }
      spec {
        container {
          name  = "mongodb"
          image = "mongo:5.0"

          port {
            container_port = 27017
          }

          env {
            name = "MONGO_INITDB_ROOT_USERNAME"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mongodb_secret.metadata[0].name
                key  = "MONGO_USERNAME"
              }
            }
          }

          env {
            name = "MONGO_INITDB_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mongodb_secret.metadata[0].name
                key  = "MONGO_PASSWORD"
              }
            }
          }

          volume_mount {
            name       = "mongodb-storage"
            mount_path = "/data/db"
          }
        }

        volume {
          name = "mongodb-storage"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.mongodb_pvc.metadata[0].name
          }
        }
      }
    }
  }
}
