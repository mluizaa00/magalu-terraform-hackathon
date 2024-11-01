terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
      version = "0.27.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

module "mongodb" {
  source = "./mongodb"

  mongo_user_property = var.mongo_user_property
  mongo_password_property = var.mongo_password_property
  mongo_user = kubernetes_secret.mongodb_secret.data["MONGO_USERNAME"]
  mongo_password = kubernetes_secret.mongodb_secret.data["MONGO_PASSWORD"]
  mongo_secret_name = kubernetes_secret.mongodb_secret.metadata[0].name
  namespace = kubernetes_namespace.plataforma.metadata[0].name
}

module "statistic-management" {
  source = "./statistic-management"

  mongo_user_property = var.mongo_user_property
  mongo_password_property = var.mongo_password_property
  mongo_secret_name = kubernetes_secret.mongodb_secret.metadata[0].name
  namespace = kubernetes_namespace.plataforma.metadata[0].name
}