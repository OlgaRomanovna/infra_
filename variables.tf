variable "yandex_cloud_token" {
  description = "Yandex Cloud authorization token. Use 'yc iam create-token' to receive"
  type        = string
  sensitive   = true
}


variable "yandex_cloud_id" {
  description = "id catalog yandex cloud"
  type        = string
  sensitive   = true
}


variable "yandex_folder_id" {
  description = "Yandex Cloud id_folder"
  type        = string
  sensitive   = true
}

variable "yandex_network_id_srv" {
  description = "Network ID"
  type        = string
}

variable "yandex_network_id_cluster" {
  description = "Network ID"
  type        = string
}

variable "yandex_subnet_id_srv" {
  description = "Subnet ID"
  type        = string
}

variable "yandex_subnet_id_cluster" {
  description = "Subnet ID"
  type        = string
}

variable "yandex_service_account_id" {
  description = "Service account ID"
  type        = string
}

variable "yandex_service_account_id_cluster" {
  description = "Service account ID fo cluster"
  type        = string
}

variable "yandex_zone" {
  description = "Placement zone"
  type        = string
}

variable "yandex_subnet_id_app" {
  description = "Subnet ID"
  type        = string
}
