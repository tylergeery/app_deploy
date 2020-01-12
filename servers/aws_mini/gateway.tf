resource "aws_internet_gateway" "aws-mini-gw" {
    vpc_id = aws_vpc.aws-mini-vpc.id
    tags = {
        Name = "aws-mini-gw"
    }
}