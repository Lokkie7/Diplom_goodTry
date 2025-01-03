resource "yandex_container_registry" "my-reg" {
  name = "registry-for-app"
  folder_id = var.folder_id
  labels = {
    my-label = "my-label-value"
  }
}
