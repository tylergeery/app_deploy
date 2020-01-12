resource "aws_subnet" "aws-mini-subnet" {
    cidr_block = cidrsubnet(aws_vpc.aws-mini-vpc.cidr_block, 4, 1)
    vpc_id = aws_vpc.aws-mini-vpc.id
    availability_zone = "us-west-1b"
}

resource "aws_route_table" "aws-mini-route-table" {
    vpc_id = aws_vpc.aws-mini-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aws-mini-gw.id
    }
    tags = {
        Name = "aws-mini-route-table"
    }
}

resource "aws_route_table_association" "subnet-association" {
    subnet_id      = aws_subnet.aws-mini-subnet.id
    route_table_id = aws_route_table.aws-mini-route-table.id
}