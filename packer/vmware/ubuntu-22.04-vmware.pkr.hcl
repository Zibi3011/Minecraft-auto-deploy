source "vmware-iso" "ubuntu" {
  iso_url      = "https://releases.ubuntu.com/jammy/ubuntu-22.04.5-live-server-amd64.iso"
  iso_checksum = "sha256:9bc6028870aef3f74f4e16b900008179e78b130e6b0b9a140635434a46aa98b0"
  
  vm_name       = "minecloud-base-${var.image_version}"
  guest_os_type = "ubuntu-64"
  version       = "14"
  
  cpus   = 2
  memory = 4096
  disk_size = 20480
  disk_type_id = "0"
  
  network = "nat"
  
  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_timeout  = "45m"
  
  boot_wait = "5s"
  boot_command = [
    "c",
    "<wait>",
    "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/'",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot<enter>"
  ]
  
  http_directory = "http"
  shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
}

build {
  sources = ["source.vmware-iso.ubuntu"]
  
  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y curl git htop unzip vim wget ca-certificates gnupg lsb-release",
      "curl -fsSL https://get.docker.com -o /tmp/get-docker.sh",
      "sudo sh /tmp/get-docker.sh",
      "sudo systemctl enable docker",
      "sudo apt-get install -y docker-compose-plugin",
      "sudo useradd -m -s /bin/bash minecloud",
      "sudo usermod -aG docker minecloud",
      "sudo usermod -aG sudo minecloud",
      "echo 'minecloud ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/minecloud",
      "sudo chmod 0440 /etc/sudoers.d/minecloud",
      "sudo apt-get autoremove -y",
      "sudo apt-get clean"
    ]
  }
}