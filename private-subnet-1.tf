# Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "${var.private_subnet_1_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "private-subnet-1"
  }
}

# Private Subnet 1 Route Table
resource "aws_route_table" "route-table-private-subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway.id
  }
  tags = {
    "Name" = "Private Subnet 1 Route Table"
  }
}

# Associate Pruvate Subnet 1 with Route Table for Private Subnet 1
resource "aws_route_table_association" "route-table-private-subnet-1-association" {
  subnet_id = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.route-table-private-subnet-1.id
}

# ----------------------------------------------------

# Private Subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "private-subnet-2"
  }
}

# Private Subnet 2 Route Table
resource "aws_route_table" "route-table-private-subnet-2" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-2.id
  }
  tags = {
    "Name" = "Private Subnet 2 Route Table"
  }
}

# Associate Private Subnet 2 with Route Table for Private Subnet 2
resource "aws_route_table_association" "route-table-private-subnet-2-association" {
  subnet_id = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.route-table-private-subnet-2.id
}