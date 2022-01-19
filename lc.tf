# Create our instance

resource "aws_launch_configuration" "WebApp" {
  name_prefix                 = "Server_for_WebApp-"
  image_id                    = data.aws_ami.amazon-linux-2.id #Amazon Linux IMA
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.forWebApp.id]
  user_data                   = file("userdata.sh")

  lifecycle {
    prevent_destroy           = false
    #ignore_changes           = ["user_data"]
    create_before_destroy     = true
  }

}