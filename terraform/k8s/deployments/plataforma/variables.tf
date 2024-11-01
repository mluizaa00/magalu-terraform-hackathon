variable "mongo-user-property" {
  type        = string
  default     = "at7"
  description = "Default resource name"
}

variable "mongo-password-property" {
  type        = string
  default     = "MONGO_PASSWORD"
  description = "Mongo password property on environment variables"
}