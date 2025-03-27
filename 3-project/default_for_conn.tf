###cloud vars
variable "token" {
  type        = string
  default     = "y0_AgAAAAAbzSe1AATuwQAAAAD9usAbAABO5zMGkutHHINMJJ4_c9N2zXKZ9Q"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gg6k1qulpgskn6jnfm"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gchoos90euojkta52j"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
