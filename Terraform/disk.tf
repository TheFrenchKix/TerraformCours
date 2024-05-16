resource "google_compute_attached_disk" "attached_disk_001" {
  disk     = resource.google_compute_disk.disk_001.id
  instance = module.instance-nginx.instance-id
}

resource "google_compute_disk" "disk_001" {
  name  = "disk-001"
  type  = "pd-standard"
  size  = 10
  zone  = "us-central1-a"
}

resource "google_compute_disk" "disk_002" {
  name  = "disk-002"
  type  = "pd-standard"
  size  = 10
  zone  = "us-central1-a"
}