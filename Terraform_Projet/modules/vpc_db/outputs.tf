output "vpc-name" {
  value       = resource.google_compute_network.vpc_network.name
  description = "Voici le nom de la VM"
}

output "subnet-name" {
  value       = resource.google_compute_subnetwork.vpc_subnet.name
  description = "Voici le nom de la VM"
}

output "ip_cidr_range" {
  value       = resource.google_compute_subnetwork.vpc_subnet.ip_cidr_range
  description = "Voici le nom de la VM"
}

output "self_link" {
  value       = resource.google_compute_subnetwork.vpc_subnet.self_link
  description = "Voici le nom de la VM"
}

output "id" {
  value       = resource.google_compute_network.vpc_network.id
  description = "Voici le nom de la VM"
}