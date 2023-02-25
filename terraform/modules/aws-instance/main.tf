data "aws_ami" "linux_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu*"]
    }
    filter {
        name   = "description"
        values = ["Canonical, Ubuntu, 22*"]
    }
    filter {
        name   = "owner-alias"
        values = ["amazon"]
    }
    filter {
        name   = "architecture"
        values = ["arm64"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "state"
        values = ["available"]
    }
}


resource "aws_instance" "ec2" {
  ami           = data.aws_ami.linux_ami.id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true
  user_data     = var.user_data

  tags = {
    Name = "${var.common_name}_ec2"
  }
}
