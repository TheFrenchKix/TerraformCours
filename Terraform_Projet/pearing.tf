resource "google_compute_network_peering" "network_to_networkdb" {
  name         = "network-to-networkdb"
  network      = module.vpc.id
  peer_network = module.vpc_db.id
}

resource "google_compute_network_peering" "networkdb_to_network" {
  name         = "networkdb-to-network"
  network      = module.vpc_db.id
  peer_network = module.vpc.id
}