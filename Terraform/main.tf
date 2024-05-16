module "instance-nginx" {
    source = "./modules/instances"
    name = "insset-nginx"
    size = "e2-medium"
    vpc-name = module.vpc.vpc-name
    subnet-name = module.vpc.subnet-name
    tags = "web"
}

module "instance-bastion" {
    source = "./modules/instances"
    name = "insset-bastion"
    size = "e2-medium"
    vpc-name = module.vpc.vpc-name
    subnet-name = module.vpc.subnet-name
    tags = "bastion"
}

module "instance-db" {
    source = "./modules/instances_db"
    name = "insset-db"
    size = "e2-medium"
    vpc-name = module.vpc_db.vpc-name
    subnet-name = module.vpc_db.subnet-name
    tags = "db"
}

module "vpc" {
    source = "./modules/vpc"
    vpc-name = "mon-vpc-terraform-002"
    subnet-name = "mon-subnet-terraform-002"
    ip_cidr_range = "10.0.20.0/24"
}

module "vpc_db" {
    source = "./modules/vpc_db"
    vpc-name = "mon-vpc-terraform-db"
    subnet-name = "mon-subnet-terraform-db"
    ip_cidr_range = "10.0.21.0/24"
}