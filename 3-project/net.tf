resource "yandex_vpc_network" "main" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "one" {
  name           = var.subnet_name_1
  zone           = var.default_zone_1
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = var.default_cidr_1
}
resource "yandex_vpc_subnet" "two" {
  name           = var.subnet_name_2
  zone           = var.default_zone_2
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = var.default_cidr_2
}
resource "yandex_vpc_subnet" "three" {
  name           = var.subnet_name_3
  zone           = var.default_zone_3
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = var.default_cidr_3
}
