variable "common_name" {
  description = "Common name of the resources"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
}

variable "subnet_id" {
  description = "Subnet IDs for EC2 instances"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for EC2 instances"
  type        = list(string)
}

variable "user_data" {
  description = "User data for EC2 instances"
  type        = string
}
