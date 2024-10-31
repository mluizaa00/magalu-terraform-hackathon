variable "region" {
  type        = string
  default     = "br-se1"
  description = "Região"
}

# This should be a secret/vault
variable "api-key" {
  type        = string
  default     = "d6970010-59c9-4468-8d20-aa30bfcf42f8"
  description = "API Key Credential"
}

variable "name" {
  type        = string
  default     = "at7"
  description = "Default resource name"
}