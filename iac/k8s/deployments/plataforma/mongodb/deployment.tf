locals {
  mongo_user_property = var.mongo_user_property
  mongo_password_property = var.mongo_password_property
  mongo_secret_name = var.mongo_secret_name
  namespace = var.namespace
}

resource "kubernetes_deployment" "mongodb" {
  metadata {
    name      = "mongodb"
    namespace = local.namespace
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
                name = local.mongo_secret_name
                key  = local.mongo_user_property
              }
            }
          }

          env {
            name = "MONGO_INITDB_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = local.mongo_secret_name
                key  = local.mongo_password_property
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
