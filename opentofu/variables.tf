variable "talos_version" {
  type    = string
  default = "v1.9.5"
}

variable "HCLOUD_TOKEN" {
  type      = string
  sensitive = true
}

variable "PRIVATE_HOME_IP" {
  type      = list(string)
  sensitive = true
}

variable "CLUSTER_NAME" {
  type      = string
}
