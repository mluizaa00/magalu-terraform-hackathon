resource "mgc_object_storage_buckets" "secomp-bucket" {
  provider = mgc.sudeste
  bucket = "secomp-atesete"
  enable_versioning = true
  recursive = true 
  bucket_is_prefix = false
}