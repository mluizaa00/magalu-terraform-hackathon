terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
  }
}

resource "secomp_hackathon_atesete_bucket" "bucket" {
  provider = mgc.sudeste
  bucket = "secomp_hackathon_atesete_bucket"
  enable_versioning = true
  recursive = true 
  bucket_is_prefix = false
}