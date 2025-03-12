data "aws_ami" "debian_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["136693071363"] # Debian
}

data "aws_vpc" "default" {
  default = true
} 
resource "aws_instance" "freq" {  
  ami           = data.aws_ami.debian_ami.id
  instance_type = var.instance_type
  tags = {
    Name = "debian-instance-freq"
  }
}

resource "aws_security_group" "freq"{
  name = "freq"
  description = "Allow http and https in from inet 192.168.254.128/24: IPv4 address for the Ethernet interface with a /24 subnet mask.Allow everything out"
vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "freq_http_in" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["192.168.254.128/24"]

  security_group_id = aws_security_group.freq.id
}
