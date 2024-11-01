resource "mgc_ssh_keys" "my_key" {
  name = "AT7key2"
  key = kubernetes_secret.ssh_secret.data["SSH_KEY"]
}



