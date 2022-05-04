resource "aws_launch_template" "alt" {
  name_prefix = "ec2-web"

  image_id = data.aws_ami.ubuntu.id

  network_interfaces {
    device_index                = 0
    ipv4_address_count          = 0
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.vpc-public-web.id]
    associate_public_ip_address = true
    delete_on_termination       = true
  }

  instance_type = "t2.micro"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = true
      volume_size = 8
      volume_type = "gp2"
    }
  }

  iam_instance_profile {
    arn = "arn:aws:iam::104785054338:instance-profile/EC2Role"
  }

  disable_api_termination = false
  ebs_optimized = false
  user_data = data.template_cloudinit_config.config.rendered
  update_default_version = true
}