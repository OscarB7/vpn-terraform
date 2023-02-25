output "instance_ids" {
  description = "IDs of EC2 instance"
  value       = aws_instance.ec2.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "ami_id" {
  description = "AMI ID of EC2 instance"
  value       = data.aws_ami.linux_ami.id
}

output "ami_description" {
  description = "AMI description of EC2 instance"
  value       = data.aws_ami.linux_ami.description
}
