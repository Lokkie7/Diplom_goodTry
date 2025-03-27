###cloud vars
variable "token" {
  type        = string
  default     = "..."
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "..."
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "..."
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_1" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "access_key" {
  type        = string
  default     = "YCAJEZ2zU2bghSBDJJGgKGBcH"
}

variable "secret_key" {
  type        = string
  default     = "YCOjwfNrIFfdI2Of1ge9OkPH4U93GRKLv9LCbIU7"
}
