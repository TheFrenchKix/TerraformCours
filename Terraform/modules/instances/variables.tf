variable name {
  type        = string
  default     = "value"
  description = "Le nom de l'instance"
}

variable "size" {
  type        = string
  default     = "standard-1"
  description = "Taille de l'instance"
}

variable "vpc-name" {
  type        = string
  description = "Le nom du vpc"
}

variable "subnet-name" {
  type        = string
  description = "Le nom du vpc"
}

variable "tags" {
  type        = string
  description = "Les tags à appliquer à l'instance"
}