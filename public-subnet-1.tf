# Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "${var.public_subnet_1_cidr}"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "public-subnet-1"
  }
}

# Public Route Table
resource "aws_route_table" "route-table-public-subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    "Name" = "route-table-public-subnet-1"
  }
}

# Public Subnet 1 association with Public Route Table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route-table-public-subnet-1.id
}

# Elastic IP for Nat-Gateway
resource "aws_eip" "elastic-for-my-nat-gateway" {
  vpc = true
  tags = {
    "Name" = "elastic-ip-1"
  }
}

# Nat-Gateway in public subnet 1
resource "aws_nat_gateway" "my-nat-gateway" {
  allocation_id = aws_eip.elastic-for-my-nat-gateway.id
  subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    "Name" = "my-nat-gateway"
  }
}