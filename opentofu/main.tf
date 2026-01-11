module "talos" {
  source                    = "hcloud-talos/talos/hcloud"
  version                   = "2.21.3"
  talos_version             = "1.9.5"
  firewall_use_current_ip   = false
  # firewall_kube_api_source  = concat(var.PRIVATE_HOME_IP, tolist(data.spacelift_ips.ips.ips))
  # firewall_talos_api_source = concat(var.PRIVATE_HOME_IP, tolist(data.spacelift_ips.ips.ips))
  firewall_kube_api_source  = var.PRIVATE_HOME_IP
  firewall_talos_api_source = var.PRIVATE_HOME_IP
  cluster_name              = var.CLUSTER_NAME
  cluster_domain            = "cluster.${var.CLUSTER_NAME}.local"
  cluster_api_host          = "kube.${var.CLUSTER_NAME}"
  datacenter_name           = "fsn1-dc14"
  control_plane_count       = 1
  control_plane_server_type = "cpx11"
  hcloud_token              = var.HCLOUD_TOKEN
  disable_arm               = true
  worker_count              = 0
  sysctls_extra_args = {
    # Fix for https://github.com/cloudflare/cloudflared/issues/1176
    "net.core.rmem_default" = "26214400"
    "net.core.wmem_default" = "26214400"
    "net.core.rmem_max"     = "26214400"
    "net.core.wmem_max"     = "26214400"
  }
  kubelet_extra_args = {
    system-reserved            = "cpu=100m,memory=250Mi,ephemeral-storage=1Gi"
    kube-reserved              = "cpu=100m,memory=200Mi,ephemeral-storage=1Gi"
    eviction-hard              = "memory.available<100Mi,nodefs.available<10%"
    eviction-soft              = "memory.available<200Mi,nodefs.available<15%"
    eviction-soft-grace-period = "memory.available=2m30s,nodefs.available=4m"
  }
}
