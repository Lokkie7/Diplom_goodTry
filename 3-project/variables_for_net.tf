variable "default_zone_1" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_zone_2" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_zone_3" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_1" {
  type        = list(string)
  default     = ["10.128.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "default_cidr_2" {
  type        = list(string)
  default     = ["10.129.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "default_cidr_3" {
  type        = list(string)
  default     = ["10.130.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "main"
  description = "VPC network name"
}
variable "subnet_name_1" {
  type        = string
  default     = "one"
  description = "subnet name 1"
}
variable "subnet_name_2" {
  type        = string
  default     = "two"
  description = "subnet name 2"
}
variable "subnet_name_3" {
  type        = string
  default     = "three"
  description = "subnet name 3"
}
