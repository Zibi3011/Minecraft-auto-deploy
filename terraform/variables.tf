# terraform/variables.tf

variable "vm_memory" {
  default = "4096" # 4GB RAM
}

variable "vm_cpus" {
  default = 2
}

variable "vm_name" {
  default = "MineCloud-Production"
}
