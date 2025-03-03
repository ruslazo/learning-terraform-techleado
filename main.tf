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

provider "aws" {
  region = "eu-central-1"  # Replace with your desired region
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.debian_ami.id
  instance_type = var.instance_type
  tags = {
    Name = "debian-instance"
  }
}