resource "google_compute_firewall" "all-bastion" {
    name = "allow-all-to-bastion"
    network = module.vpc.vpc-name
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["bastion"]
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
}

resource "google_compute_firewall" "all-web" {
    name = "allow-all-to-web"
    network = module.vpc.vpc-name
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web"]
    allow {
        protocol    = "tcp"
        ports       = ["80"]
    }
}

resource "google_compute_firewall" "bastion-ssh" {
    name = "allow-bastion-to-ssh"
    network = module.vpc.vpc-name
    target_tags = ["web"]
    source_tags = ["bastion"]
    allow {
        protocol    = "tcp"
        ports       = ["22"]
    }
}

resource "google_compute_firewall" "deny-all" {
    name = "deny-all"
    network = module.vpc.vpc-name
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["web", "bastion"]
    priority = 2000
    deny {
        protocol    = "tcp"
        ports       = ["1-65535"]
    }
}

resource "google_compute_firewall" "bastion-db" {
    name = "allow-bastion-to-db"
    network = module.vpc_db.vpc-name
    source_ranges = [module.instance-bastion.nat-ip-instance]
    target_tags = ["db"]
    allow {
        protocol    = "tcp"
        ports       = ["22"]
    }
}

resource "google_compute_firewall" "deny-all-db" {
    name = "deny-all-db"
    network = module.vpc_db.vpc-name
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["db"]
    priority = 2000
    deny {
        protocol    = "tcp"
        ports       = ["1-65535"]
    }
}