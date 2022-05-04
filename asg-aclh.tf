resource "aws_autoscaling_policy" "test-policy" {
  name                   = "Target-Tracking-Policy"
  autoscaling_group_name = aws_autoscaling_group.ec2-web-scaling.name
  policy_type            = "TargetTrackingScaling"
  adjustment_type        = ""
  scaling_adjustment     = 0
  cooldown               = 0
  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${aws_alb.terraform-web-alb.arn_suffix}/${aws_lb_target_group.terraform-web-tg.arn_suffix}"
    }
    target_value = 50
  }
}

resource "aws_autoscaling_policy" "scale-in" {
  name                   = "Scale-in-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ec2-web-scaling.name
}

resource "aws_autoscaling_policy" "scale-out" {
  name                   = "Scale-out-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ec2-web-scaling.name
}
