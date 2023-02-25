data "aws_availability_zones" "az" {
  state = "available"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.common_name}_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.common_name}_igw"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.common_name}_rt"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "${var.common_name}_subnet"
  }
}

resource "aws_route_table_association" "rt_association_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_security_group" "sg_vpn_public" {
  name = "${var.common_name}-sg"
  vpc_id      = aws_vpc.main_vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = split(",", var.sg_vpn_public_egress_rules.cidr_blocks)
  }
  ingress {
    from_port = var.sg_vpn_public_egress_rules.port
    to_port = var.sg_vpn_public_egress_rules.port
    protocol = var.sg_vpn_public_egress_rules.protocol
    cidr_blocks = split(",", var.sg_vpn_public_egress_rules.cidr_blocks)
  }
}
