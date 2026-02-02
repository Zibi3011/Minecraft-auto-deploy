source "virtualbox-iso" "ubuntu" {
  vm_name      = "minecloud-base-${var.image_version}"
  guest_os_type = "Ubuntu_64"

  iso_url      = "https://releases.ubuntu.com/22.04/ubuntu-22.04.5-live-server-amd64.iso"
  iso_checksum = "sha256:9bc6028870aef3f74f4e16b900008179e78b130e6b0b9a140635434a46aa98b0"

  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_timeout  = "30m"

  cpus   = 2
  memory = 4096
  disk_size = 20480

  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/<enter>",
    "initrd /casper/initrd<enter>",
    "boot<enter>"
  ]

  http_directory = "http"

  shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
}

build {
  sources = ["source.virtualbox-iso.ubuntu"]

  provisioner "ansible" {
    playbook_file = "ansible/playbook.yml"
  }
}
