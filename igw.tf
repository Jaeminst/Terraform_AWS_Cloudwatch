resource "aws_internet_gateway" "project-igw" {
    vpc_id = aws_vpc.project-vpc.id
    tags = {
        Name = "terraform-igw"
    }
}