resource "aws_alb" "terraform-web-alb" {
  name            = "terraform-web-alb"
  internal        = false
  load_balancer_type = "application"
  idle_timeout    = 60
  security_groups = [aws_security_group.vpc-public-web.id]
  subnets         = [aws_subnet.public1.id, aws_subnet.public2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "terraform sprint"
  }
}
