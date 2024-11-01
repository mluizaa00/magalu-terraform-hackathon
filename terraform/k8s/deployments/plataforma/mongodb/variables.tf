variable "mongo_user_property" {
  type        = string
  default     = "MONGO_USER"
  description = "Default resource name"
}

variable "mongo_password_property" {
  type        = string
  default     = "MONGO_PASSWORD"
  description = "Mongo password property on environment variables"
}

variable "mongo_user" {
  type        = string
  default     = "admin"
  description = "Default mongodb root user name"
}

variable "mongo_password" {
  type        = string
  default     = "admin"
  description = "Default mongodb root user password"
}

variable "mongo_secret_name" {
  type        = string
  default     = "admin"
  description = "Default mongodb credentials secret name"
}

variable "namespace" {
  type        = string
  default     = "plataforma"
  description = "Default namespace"
}