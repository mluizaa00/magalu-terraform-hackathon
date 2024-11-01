locals {
  region = var.region
  api-key = var.api-key
}

provider "mgc" {
  alias = "sudeste"
  region = local.region
  api_key = local.api-key
  object_storage = {
    key_pair = { 
      key_id = local.api-key
      key_secret = local.api-key
    }
  }
}
