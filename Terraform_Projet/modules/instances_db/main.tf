resource "google_compute_instance" "db-instances" {
  name         = var.name
  machine_type = var.size
  zone         = "us-west1-a"
  tags         = [var.tags]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = var.vpc-name
    subnetwork = var.subnet-name
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "leo:${file("~/.ssh/id_rsa.pub")}"
  }

}