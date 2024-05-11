# Variables
# Переменная определяющая токен подключения к облаку яндекс
variable "yandex_cloud_token" {
  description = "Default cloud token in yandex cloud"
  type        = string
  default = "y0_AgAEA7qj9U5GAATuwQAAAAEDgp8cAADigLksjyVHdatA7SdvMpHec5FyIw"
}

# Переменная определяющая id облака, где развернуть ВМ
variable "yandex_cloud_id" {
  description = "Default cloud ID in yandex cloud"
  type        = string
  default = "b1g7vkhbcqtrmdal9ldq"
}

# Переменная определяющая id папки, где развернуть ВМ
variable "yandex_folder_id" {
  description = "Default folder ID in yandex cloud"
  type        = string
  default = "b1go08ncenlj430ni1rd"
}
