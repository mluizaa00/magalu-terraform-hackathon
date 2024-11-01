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