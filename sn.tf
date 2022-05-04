resource "aws_subnet" "public1" {
    vpc_id                  = aws_vpc.project-vpc.id
    cidr_block              = cidrsubnet("${aws_vpc.project-vpc.cidr_block}", 4, 0) #"172.18.0.0/20"
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private1" {
    vpc_id                  = aws_vpc.project-vpc.id
    cidr_block              = cidrsubnet("${aws_vpc.project-vpc.cidr_block}", 4, 2) #"172.18.32.0/20"
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = false
}

resource "aws_subnet" "public2" {
    vpc_id                  = aws_vpc.project-vpc.id
    cidr_block              = cidrsubnet("${aws_vpc.project-vpc.cidr_block}", 4, 1) #"172.18.16.0/20"
    availability_zone       = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private2" {
    vpc_id                  = aws_vpc.project-vpc.id
    cidr_block              = cidrsubnet("${aws_vpc.project-vpc.cidr_block}", 4, 3) #"172.18.48.0/20"
    availability_zone       = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = false
}
