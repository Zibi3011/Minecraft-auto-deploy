# terraform/outputs.tf

output "production_server_ip" {
  description = "L'adresse IP publique pour se connecter au serveur Minecraft"
  value       = vmwareworkstation_vm.minecraft_server.ip_address
}

output "web_status_url" {
  description = "URL pour consulter le statut Web (Port 80/5000)"
  value       = "http://${vmwareworkstation_vm.minecraft_server.ip_address}:80"
}
