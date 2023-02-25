output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.main_vpc.id
}

output "subnet_public_id" {
  description = "ID of subnet"
  value       = aws_subnet.subnet_public.id
}

output "sg_vpn_public_id" {
  description = "ID of security group"
  value       = aws_security_group.sg_vpn_public.id
}
