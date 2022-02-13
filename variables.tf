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

variable "public_subnet_2_cidr" {
  description = "public-subnet-2 cidr block"
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "private-subnet-1 cidr block"
  type = string
  default = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "private-subnet-2 cidr block"
  type = string
  default = "10.0.4.0/24"
}

variable "ssh_location" {
  description = "IP Address from which you want to allow ssh access to your instances"
  type = string
  default = "0.0.0.0/0"
}

variable "keyName" {
  description = "Key Name for nginx server ssh access"
  type = string
  default = "ssh-key-pair"
}