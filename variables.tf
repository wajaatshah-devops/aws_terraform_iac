variable "vpc_cidr" {
  description = "VPC CIDR Block Range"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "public-subnet-1 cidr block"
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  description = "private-subnet-1 cidr block"
  type = string
  default = "10.0.2.0/24"
}