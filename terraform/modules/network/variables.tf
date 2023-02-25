variable "common_name" {
  description = "Common name of the resources"
  type        = string
}

# VPC
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

# Subnet
variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

# Security Group
variable "sg_vpn_public_egress_rules" {
  type = map(string)
}
