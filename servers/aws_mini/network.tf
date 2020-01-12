resource "aws_vpc" "aws-mini-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "aws-mini"
    }
}

resource "aws_eip" "aws-mini-ip" {
  instance = aws_instance.aws-mini-ec2.id
  vpc      = true
}