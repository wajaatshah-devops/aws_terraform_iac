data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }


}

output "ami" {
  description = "Ami's available in aws"
  value = data.aws_ami.amazon-linux-2.name
}

resource "aws_instance" "nginx-webserver" {
  depends_on = [aws_internet_gateway.internet-gateway]

  ami = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "${var.keyName}"
  vpc_security_group_ids = [ 
    "${aws_security_group.webserver-security-group.id}",
    "${aws_security_group.ssh-security-group.id}"
  ]
  subnet_id = "${aws_subnet.public-subnet-1.id}"
}

resource "aws_alb_target_group_attachment" "my-alb-nginx-attachment" {
  target_group_arn = aws_alb_target_group.my-alb-target-group.arn
  target_id = aws_instance.nginx-webserver.id
  port = 80
}