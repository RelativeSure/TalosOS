output "talosconfig" {
  value     = module.talos.talosconfig
  sensitive = true
}

output "kubeconfig" {
  value     = module.talos.kubeconfig
  sensitive = true
}

# output "spacelift_ips" {
#   value = data.spacelift_ips.ips.ips
# }
