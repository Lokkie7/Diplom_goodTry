// Создание статического ключа доступа
//resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
//  service_account_id = yandex_iam_service_account.sa.id
//  description        = "static access key for object storage"
//}

resource "yandex_storage_bucket" "state" {
  access_key            = var.access_key
  secret_key            = var.secret_key
  bucket                = "terrastate"
  max_size              = 20000000
  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }
}
