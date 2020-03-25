locals {
    ami_name = "ami-0d1cd67c26f5fca19"
    key_name = "aws-mini"
}

resource "aws_instance" "aws-mini-ec2" {
    ami = local.ami_name
    instance_type = "t3.nano"
    key_name = local.key_name
    vpc_security_group_ids = [
        aws_security_group.aws-mini-sg.id
    ]
    tags = {
        Name = local.ami_name
    }
    subnet_id = aws_subnet.aws-mini-subnet.id
}