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

# Указываем где и какой ключ взять
variable "ssh_credentials" {
  description = "Credentials for connect to instances"
  type        = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default     = {
    user        = "ubuntu"
    private_key = "/Users/o_romanovna/.ssh/id_rsa"
    pub_key     = "/Users/o_romanovna/.ssh/id_rsa.pub"
  }
}
