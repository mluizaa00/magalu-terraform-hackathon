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

          # liveness_probe {
          #   http_get {
          #     path = "/health"
          #     port = "http-server"
          #   }
          #   initial_delay_seconds = 50
          #   timeout_seconds       = 10
          #   period_seconds        = 15
          #   success_threshold     = 1
          #   failure_threshold     = 2
          # }

          # readiness_probe {
          #   http_get {
          #     path = "/health"
          #     port = "http-server"
          #   }
          #   initial_delay_seconds = 50
          #   timeout_seconds       = 10
          #   period_seconds        = 15
          #   success_threshold     = 1
          #   failure_threshold     = 2
          # }

          # startup_probe {
          #   http_get {
          #     path = "/health"
          #     port = "http-server"
          #   }
          #   initial_delay_seconds = 50
          #   timeout_seconds       = 10
          #   period_seconds        = 15
          #   success_threshold     = 1
          #   failure_threshold     = 2
          # }
        }
      }
    }
  }
}
