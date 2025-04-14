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
  default     = "..."
  sensitive   = true
}

variable "secret_key" {
  type        = string
  default     = "..."
  sensitive   = true
}
