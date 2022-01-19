# Create ASG

resource "aws_autoscaling_group" "WebApp" {
  name                    = "ASG-${aws_launch_configuration.WebApp.name}"
  launch_configuration    = aws_launch_configuration.WebApp.name
  min_size                = 2
  max_size                = 3
  min_elb_capacity        = 2
  health_check_type       = "ELB"
  vpc_zone_identifier     = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id ]
  load_balancers          = [aws_elb.Balanser_for_WebApp.name]

  dynamic "tag" {
    for_each              = {
      Name                = "Serv_for_WebApp_in_ASG"
      Owner               = "Che"
    }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  lifecycle {
    create_before_destroy  = true
  }
}