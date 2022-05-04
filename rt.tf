resource "aws_route_table" "project-rtb-public" {
    vpc_id = aws_vpc.project-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.project-igw.id
    }
    tags = {
        Name = "public"
    }
}

resource "aws_route_table" "project-rtb-private1" {
    vpc_id = aws_vpc.project-vpc.id
    tags = {
        Name = "private1"
    }
}

resource "aws_route_table" "project-rtb-private2" {
    vpc_id = aws_vpc.project-vpc.id
    tags = {
       Name = "private2"
   }
}
