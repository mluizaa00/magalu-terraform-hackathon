resource "kubernetes_deployment" "notes_management" {
  metadata {
    name      = "notes-management"
    namespace = kubernetes_namespace.plataforma.metadata[0].name
  }

  spec {
    replicas = 1

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_unavailable = "50%"
      }
    }

    selector {
      match_labels = {
        app = "notes-management"
      }
    }

    template {
      metadata {
        labels = {
          app = "notes-management"
        }
      }

      spec {
        container {
          name  = "notes-management"
          image = "<your-image-path>"

          image_pull_policy = "IfNotPresent"

          port {
            name           = "http-server"
            container_port = 3000
          }

          env {
            name = "MONGO_USERNAME"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mongodb_secret.metadata[0].name
                key  = "MONGO_USERNAME"
              }
            }
          }

          env {
            name = "MONGO_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.mongodb_secret.metadata[0].name
                key  = "MONGO_PASSWORD"
              }
            }
          }
        }
      }
    }
  }
}
