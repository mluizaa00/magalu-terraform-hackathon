variable "region" {
  type        = string
  default     = "br-se1"
  description = "Região"
}

# This should be a secret/vault
variable "api-key" {
  type        = string
  default     = "apikeyfromvaultmaybe?"
  description = "API Key Credential"
}

variable "name" {
  type        = string
  default     = "at7"
  description = "Default resource name"
}

variable "kubeconfig_path" {
  type        = string
  description = "kubeconfig file path"
}