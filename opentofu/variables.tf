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

# variable "SPACELIFT_API_KEY_ENDPOINT" {
#   type        = string
#   sensitive   = true
# }

# variable "SPACELIFT_API_KEY_ID" {
#   type        = string
#   sensitive   = true
# }

# variable "SPACELIFT_API_KEY_SECRET" {
#   type        = string
#   sensitive   = true
# }
