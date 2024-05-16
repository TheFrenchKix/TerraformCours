output "vm-name-instance" {
  value       = resource.google_compute_instance.db-instances.name
  description = "Voici le nom des VM instances"
}

output "instance-id" {
  value       = resource.google_compute_instance.db-instances.id
  description = "Voici l'ID des VM instances"
}

output "public-ip-instance" {
  value       = resource.google_compute_instance.db-instances.network_interface.0.access_config.0.nat_ip
  description = "Voici l'adresse IP publique de la VM"
}

output "private-ip-instance" {
  value       = resource.google_compute_instance.db-instances.network_interface.0.network_ip
  description = "Voici l'adresse IP privée de la VM"
}