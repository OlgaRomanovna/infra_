
# Provider
provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone = "ru-central1-a"
}

# Service accounts
# Создание сервисного аккаунта в яндекс облаке для кластера srv ноды
resource "yandex_iam_service_account" "o-romanovna-diplom" {
  name = "o-romanovna-diplom"
}

# Назначаем права созданного аккаунта
resource "yandex_resourcemanager_folder_iam_member" "o-romanovna-diplom-admin" {
  folder_id = var.yandex_folder_id
  role = "admin"
  member = "serviceAccount:${yandex_iam_service_account.o-romanovna-diplom.id}"
  depends_on = [
    yandex_iam_service_account.o-romanovna-diplom,
  ]
}

# Создаем ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "static-access-key" {
  service_account_id = yandex_iam_service_account.o-romanovna-diplom.id
  depends_on = [
    yandex_iam_service_account.o-romanovna-diplom,
  ]
}

# Compute instance for service
# Создаём ВМ - srv сервисную ноду, с которой будет происходить развёртывание кластера k8s, мониторинг, логирование и процессы CI/CD
resource "yandex_compute_instance" "srv" { 
  name     = "srv"
  hostname = "srv"

  resources {
    cores  = 4
    memory = 12
  }

  boot_disk {
    initialize_params {
      image_id = "fd8athleo3m2ns0c489e"
      size     = 30
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = var.yandex_subnet_id_srv
    nat       = true
  }

# SSH ключ для доступа к ВМ - нодам. Ключи создаём без пароля, Terraform не умеет работать с парольными ключами.
# Ключ в данном случае подбираем уже готовый с нашего ПК по адресу: /home/otr/.ssh/
  metadata = {
    ssh-keys = "${var.ssh_credentials.user}:${file(var.ssh_credentials.pub_key)}"
    serial-port-enable=1    
  }

}