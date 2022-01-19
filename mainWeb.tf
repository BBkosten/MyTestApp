 provider "aws" {
  region = "eu-central-1"
}
# Get availability zones and ami last version amazon linux for our instance.

data "aws_availability_zones" "zones_for_APP"{}
data "aws_ami" "amazon-linux-2" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name      = "name"
    values    = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.zones_for_APP.names[0]
}
resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.zones_for_APP.names[1]
}

