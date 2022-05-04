resource "aws_route_table_association" "project-rtb-public1" {

    route_table_id = aws_route_table.project-rtb-public.id

    subnet_id = aws_subnet.public1.id
}

resource "aws_route_table_association" "project-rtb-public2" {

    route_table_id = aws_route_table.project-rtb-public.id

    subnet_id = aws_subnet.public2.id
}

resource "aws_route_table_association" "project-rtb-private1" {

    route_table_id = aws_route_table.project-rtb-private1.id

    subnet_id = aws_subnet.private1.id
}

resource "aws_route_table_association" "project-rtb-private2" {

    route_table_id = aws_route_table.project-rtb-private2.id

    subnet_id = aws_subnet.private2.id
}
