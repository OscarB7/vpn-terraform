module "network" {
  source = "./modules/network"

  common_name = var.common_name
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"

  sg_vpn_public_egress_rules = {
      port = "51820",
      protocol = "udp",
      cidr_blocks = "0.0.0.0/0",
    }
}


module "ec2_instances" {
  source = "./modules/aws-instance"

  common_name = var.common_name
  instance_type      = var.ec2_instance_type
  subnet_id         = module.network.subnet_public_id
  security_group_ids = [module.network.sg_vpn_public_id]
  user_data = base64encode(templatefile(
    "host_setup/user_data/bootstrap.tftpl",
    {
      docker_compose_version       = var.docker_compose_version,
      docker_network_range         = var.docker_network_range,
      docker_compose_network_range = var.docker_compose_network_range,
      pihole_ip                    = var.pihole_ip,
      pihole_dns_port              = var.pihole_dns_port,
      pihole_web_port              = var.pihole_web_port,
      wg_port                      = var.wg_port,
      wg_server_private_key        = var.wg_server_private_key,
      wg_server_ip                 = var.wg_server_ip,
      wg_server_port               = var.wg_server_port,
      wg_client_public_key         = var.wg_client_public_key,
      wg_client_ip                 = var.wg_client_ip,
      tz                           = var.tz,
      pihole_webpassword           = var.pihole_webpassword,
      pihole_dns_ip                = var.pihole_dns_ip
    }
  ))
}
