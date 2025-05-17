locals {
  image = "https://factory.talos.dev/image/7fe50f59701f9f5a2305b8b7c099ec6ad91f93dbf8c430c1260d520e149383c9/${var.talos_version}/hcloud-${var.arch}.raw.xz"
}

source "hcloud" "talos" {
  rescue          = "linux64"
  image           = "debian-12"
  location        = "${var.server_location}"
  server_type     = "${var.server_type}"
  ssh_username    = "root"
  snapshot_name   = "talos system disk - ${var.arch} - ${var.talos_version}"
  snapshot_labels = {
    type    = "infra",
    os      = "talos",
    version = "${var.talos_version}",
    arch    = "${var.arch}",
  }
}

build {
  sources = ["source.hcloud.talos"]
  provisioner "shell" {
    inline = [
      "apt-get install -y wget",
      "wget -O /tmp/talos.raw.xz ${local.image}",
      "xz -d -c /tmp/talos.raw.xz | dd of=/dev/sda && sync",
    ]
  }
}
