# VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    "Name" = "my-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    "Name" = "internet-gateway"
  }
}
