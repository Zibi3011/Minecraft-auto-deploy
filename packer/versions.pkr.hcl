packer {
  required_version = ">= 1.8.0"
  required_plugins {
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = ">= 1.0.4"
    }
  }
}
