resource "aws_autoscaling_group" "ec2-web-scaling" {

  name = "terraform-web-auto-group"

  vpc_zone_identifier = [aws_subnet.public1.id, aws_subnet.public2.id]

  target_group_arns = [aws_lb_target_group.terraform-web-tg.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300

  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 3

  enabled_metrics = [
    "GroupAndWarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupInServiceCapacity",
    "GroupPendingCapacity",
    "GroupPendingInstances",
    "GroupStandbyCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "WarmPoolDesiredCapacity",
    "WarmPoolMinSize",
    "WarmPoolPendingCapacity",
    "WarmPoolTerminatingCapacity",
    "WarmPoolTotalCapacity",
    "WarmPoolWarmedCapacity",
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  metrics_granularity = "1Minute"
  
  launch_template {
    id      = aws_launch_template.alt.id
    version = "$Latest"
  }
  tag {
    key   = "name"
    value = "new-auto-scaling"
    propagate_at_launch = true
  }

}
