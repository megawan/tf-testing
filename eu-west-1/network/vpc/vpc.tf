module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr
  azs  = var.azs

  # DHCP Option Block
  enable_dhcp_options   = false
  enable_dns_hostnames  = true
  enable_dns_support    = true
  dhcp_options_domain_name_servers = [ "127.0.0.1", "AmazonProvidedDNS" ]

  # Subnet
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  database_subnets  = var.data_subnets
  create_database_subnet_group = true 

  # Nat Gateway
  enable_nat_gateway      = true
  single_nat_gateway      = false
  one_nat_gateway_per_az  = true

  # VPN Gateway
  enable_vpn_gateway                  = false
  propagate_public_route_tables_vgw   = false
  propagate_private_route_tables_vgw  = false

  # tags
  tags = {
      Environment = var.environment
      Terraform   = true
  }

  dhcp_options_tags = {
    Name = "DHCP Option ${var.environment}"
  }
}
