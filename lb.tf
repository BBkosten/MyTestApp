# Create Load Balanser

resource "aws_elb" "Balanser_for_WebApp"{
  name = "ELB-for-ConverterServers"
  availability_zones    = [data.aws_availability_zones.zones_for_APP.names[0], data.aws_availability_zones.zones_for_APP.names[1]]
  security_groups       = [aws_security_group.forWebApp.id]
  listener {
    instance_port       = 80
    instance_protocol   = "http"
    lb_port             = 80
    lb_protocol         = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "http:80/"
    interval            = 10
  }
  tags = {
    name = "Balanser_for_myWebPage"
  }
}
