# Create security group

resource "aws_security_group" "forWebApp" {
  name               = "WebAPP DynamicSecurity Group"
  description        = "OnlyForMyWebPage"

  dynamic "ingress" {
    for_each = ["80", "443", "3001", "3002"]
    content {
      from_port      = ingress.value
      to_port        = ingress.value
      protocol       = "tcp"
      cidr_blocks    = ["0.0.0.0/0"]
    }
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name             = "DynamicSecurity_group for WebAppServer"
    Owner            = "Che"
  }
}