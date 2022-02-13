# Application Load Balancer
resource "aws_alb" "my-alb" {
  name = "my-application-load-balancer"
  security_groups = [aws_security_group.my-alb-security-group.id]
  subnets = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  enable_deletion_protection = false
  tags = {
    "Name" = "Application Load Balancer"
  }
}

# Application Load Balancer Security group
resource "aws_security_group" "my-alb-security-group" {
  name = "Application Load Balancer Security Group"
  description = "Enable Http/Https access on Port 80/443"
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    description = "HTTP Access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    "Name" = "ALB Security Group"
  }
}

# Application Load Balancer Target Group
resource "aws_alb_target_group" "my-alb-target-group" {
  name = "my-alb-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.my-vpc.id
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_alb_listener" "front-end" {
  load_balancer_arn = aws_alb.my-alb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.my-alb-target-group.arn
    type = "forward"
  }
}