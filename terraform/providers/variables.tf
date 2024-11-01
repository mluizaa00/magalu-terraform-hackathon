variable "region" {
  type        = string
  default     = "br-se1"
  description = "Região"
}

# This should be a secret/vault
variable "api-key" {
  type        = string
  default     = "b932ce86-c4b7-426a-b73c-3dba5ef28c8f"
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