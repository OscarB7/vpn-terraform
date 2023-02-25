output "ec2__instance_ids" {
  description = "IDs of EC2 instance"
  value       = module.ec2_instances.instance_ids
}

output "ec2__instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2_instances.instance_public_ip
}

output "ec2__ami_id" {
  description = "AMI ID of EC2 instance"
  value       = module.ec2_instances.ami_id
}

output "ec2__ami_description" {
  description = "AMI description of EC2 instance"
  value       = module.ec2_instances.ami_description
}
