resource "google_compute_network" "vpc_network" {
    name  = var.vpc-name
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet-name
  ip_cidr_range = var.ip_cidr_range
  network       = resource.google_compute_network.vpc_network.self_link
  region        = "us-central1"
}