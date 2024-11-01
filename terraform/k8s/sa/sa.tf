resource "kubernetes_service_account" "terraform" {
  metadata {
    name      = "terraform"
    namespace = "default"
  }
}

resource "kubernetes_cluster_role_binding" "terraform_binding" {
  metadata {
    name = "terraform-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "admin" 
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.terraform.metadata[0].name
    namespace = kubernetes_service_account.terraform.metadata[0].namespace
  }
}

data "kubernetes_secret" "terraform_token" {
  metadata {
    name      = kubernetes_service_account.terraform.default_secret_name
    namespace = kubernetes_service_account.terraform.metadata[0].namespace
  }
}

output "k8s_service_account_token" {
  value = base64decode(data.kubernetes_secret.terraform_token.data["token"])
}