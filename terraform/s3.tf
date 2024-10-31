locals {
  name = var.name
}

resource "mgc_object_storage_buckets" "secomp-at7" {
  provider = mgc.sudeste
  bucket = local.name
  enable_versioning = true
  recursive = true 
  bucket_is_prefix = false
}