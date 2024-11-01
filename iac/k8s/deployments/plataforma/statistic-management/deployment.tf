locals {
  mongo_user_property = var.mongo_user_property
  mongo_password_property = var.mongo_password_property
  mongo_secret_name = var.mongo_secret_name
  namespace = var.namespace
}

resource "kubernetes_deployment" "notes_management" {
  metadata {
    name      = "statistic-management"
    namespace = local.namespace
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
        app = "statistic-management"
      }
    }

    template {
      metadata {
        labels = {
          app = "statistic-management"
        }
      }

      spec {
        container {
          name  = "statistic-management"
          image = "luizaprestesufscar/secomp-2024:latest"

          image_pull_policy = "IfNotPresent"

          port {
            name           = "http-server"
            container_port = 3003
          }

          env {
            name = local.mongo_user_property
            value_from {
              secret_key_ref {
                name = local.mongo_secret_name
                key  = local.mongo_user_property
              }
            }
          }

          env {
            name = local.mongo_password_property
            value_from {
              secret_key_ref {
                name = local.mongo_secret_name
                key  = local.mongo_password_property
              }
            }
          }
        }
      }
    }
  }
}
