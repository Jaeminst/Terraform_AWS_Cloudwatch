resource "aws_security_group" "vpc-default" {
    name        = "default terraform VPC"
    description = "default VPC security group"
    vpc_id      = aws_vpc.project-vpc.id

    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        security_groups = []
        self            = true
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform"
    }
}

resource "aws_security_group" "vpc-public-web" {
    name        = "public-web"
    description = "public-web"
    vpc_id      = aws_vpc.project-vpc.id

    ingress {
        from_port       = var.server_port
        to_port         = var.server_port
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}
