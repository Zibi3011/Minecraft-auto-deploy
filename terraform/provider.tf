# provider.tf
terraform {
  required_providers {
    # On remet le nom attendu par ton main.tf
    vmwareworkstation = {
      source  = "elsudano/vmworkstation"
      # IMPORTANT : On met 1.0.1 pour correspondre à ton dossier
      version = "1.0.1"
    }
  }
  required_version = ">= 1.0.0"
}

provider "vmwareworkstation" {
  endpoint = "https://localhost:8697/api"
  username = "Admin"
  password = "Your password"
  https    = true
  debug    = "NONE"
}
