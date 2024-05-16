variable "vpc-name" {
  type        = string
  description = "Le nom du vpc"
}

variable "subnet-name" {
  type        = string
  description = "Le nom du subnet"
}

variable "ip_cidr_range" {
  type        = string
  description = "Le cidr du subnet"
}