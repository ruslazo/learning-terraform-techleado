output "instance_ami" {
  value = aws_instance.freq.ami
}

output "instance_arn" {
  value = aws_instance.freq.arn
}

output "public_dns" {
  value = aws_instance.freq.public_dns
}

output "public_ip" {
  value = aws_instance.freq.public_ip
}
