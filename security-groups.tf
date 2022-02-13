# Security Group for SSH Access to instances
resource "aws_security_group" "ssh-security-group" {
  name = "SSH Access"
  description = "Enable SSH access on port 22"
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_location}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "SSH Security Group"
  }
}

# Security group for web servers in public subnet
resource "aws_security_group" "webserver-security-group" {
  name = "Web Server Security Group"
  description = "Enable Http/Https traffic on Port 80/443 and SSH Access on Port 22"
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    description = "HTTP Access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.my-alb-security-group.id]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "Web Server Security Group"
  }
}