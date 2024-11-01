resource "kubernetes_secret" "mongodb_secret" {
  metadata {
    name      = "mongodb-credentials"
    namespace = "plataforma" 
  }
  data = {
    MONGO_USERNAME = base64encode("admin") 
    MONGO_PASSWORD = base64encode("password")  
  }
}