resource "aws_lb_listener" "terraform-web-alb" {
  load_balancer_arn = aws_alb.terraform-web-alb.arn
  port              = var.server_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform-web-tg.arn
  }
}