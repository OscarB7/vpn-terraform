variable "common_name" {
  type = string
  default = "temp"
}

variable "ec2_instance_type" {
  type = string
  default = "t4g.nano"
}

variable "resource_tags" {
  type = map
  default = {}
}


# user data

variable "docker_compose_version" {
  type      = string
  sensitive = false
  default   = ""
}

variable "docker_network_range" {
  type      = string
  sensitive = false
  default   = "10.7.0.0/16"
}

variable "docker_compose_network_range" {
  type      = string
  sensitive = false
  default   = "10.7.107.0/24"
}

variable "pihole_ip" {
  type      = string
  sensitive = false
  default   = "10.7.107.101"
}

variable "pihole_dns_port" {
  type      = string
  sensitive = false
  default   = "53"
}

variable "pihole_web_port" {
  type      = string
  sensitive = false
  default   = "8080"
}

variable "wg_port" {
  type      = string
  sensitive = false
  default   = "51820"
}

variable "wg_server_private_key" {
  type      = string
  sensitive = true
}

variable "wg_server_ip" {
  type      = string
  sensitive = false
  default   = "10.6.0.1/24"
}

variable "wg_server_port" {
  type      = string
  sensitive = false
  default   = "51820"
}

variable "wg_client_public_key" {
  type      = string
  sensitive = true
}

variable "wg_client_ip" {
  type      = string
  sensitive = false
  default   = "10.6.0.2/32"
}

variable "tz" {
  type      = string
  sensitive = false
  default   = "America/New_York"
}

variable "pihole_webpassword" {
  type      = string
  sensitive = true
}

variable "pihole_dns_ip" {
  type      = string
  sensitive = false
  default   = "1.1.1.1"
}
