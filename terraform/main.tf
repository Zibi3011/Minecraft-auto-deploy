# 1. Réseau (Simulé via VMware)
resource "vmwareworkstation_network" "minecloud_vpc" {
  network_name = "MineCloud-VPC"
  subnet       = "192.168.10.0/24"
}

# 2. Compute (La VM de Production)
resource "vmwareworkstation_vm" "minecraft_server" {
  name             = "MineCloud-Prod-Server"
# Chemin vers l'image créée par Packer
  source_vmx       = "../packer/output-minecloud/minecloud-base-v1.vmx"
  target_directory = "../Production/MineCloud"

# Taille recommandée : e2-medium (2 vCPU, 4GB RAM)
  cpus      = 2
  memory    = 4096

  network_adapter {
    network_name = vmwareworkstation_network.minecloud_vpc.network_name
    adapter_type = "nat"
  }
}


