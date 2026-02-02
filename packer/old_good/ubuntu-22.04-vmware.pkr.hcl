# ubuntu-22.04-vmware.pkr.hcl

source "vmware-iso" "ubuntu" {
  # ISO Configuration
  iso_url      = "https://releases.ubuntu.com/22.04/ubuntu-22.04.3-live-server-amd64.iso"
  iso_checksum = "sha256:a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
  
  # VM Configuration
  vm_name       = "minecloud-base-${var.image_version}"
  guest_os_type = "ubuntu-64"
  version       = "14"
  
  # Hardware
  cpus   = 2
  memory = 4096
  disk_size = 20480
  disk_type_id = "0"
  
  # Network
  network = "nat"
  
  # SSH Configuration
  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_timeout  = "20m"
  
  # Boot Configuration
  boot_wait = "5s"
  boot_command = [
    "<esc><wait>",
    "c<wait>",
    "linux /casper/vmlinuz autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
  
  http_directory = "http"
  shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
}

build {
  sources = ["source.vmware-iso.ubuntu"]
  
  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yml"
    user          = "ubuntu"
  }
}
