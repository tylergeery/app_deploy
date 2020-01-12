locals {
    ami_name = "ami-0dd655843c87b6930"
    key_name = "aws-mini"
}

resource "aws_instance" "aws-mini-ec2" {
    ami = local.ami_name
    instance_type = "t2.micro"
    key_name = local.key_name
    security_groups = [
        aws_security_group.aws-mini-sg.id
    ]
    tags = {
        Name = local.ami_name
    }
    subnet_id = aws_subnet.aws-mini-subnet.id
}