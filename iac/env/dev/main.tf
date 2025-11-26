module "provider" {
  
  source = "../../modules/provider"

  module_region = var.development_aws_region

}

module "vpc" {
  
    source = "../../modules/vpc"

    module_cidr_block           = var.development_cidr_block
    module_instance_tenancy    = var.development_instance_tenancy
    module_enable_dns_support  = var.development_enable_dns_support
    module_enable_dns_hostnames = var.development_enable_dns_hostnames
    module_vpc_name            = var.development_vpc_name
    module_internet_gateway_name = var.development_internet_gateway_name

}

module "subnets" {
  
  source = "../../modules/subnet"

  module_vpc_id = module.vpc.vpc_id

  module_subnets = {
    bastion_subnet = {
      cidr_block              = var.development_bastion_subnet_cidr_block
      az                      = var.development_bastion_subnet_az
      map_public_ip_on_launch = true
      name                    = var.development_bastion_subnet_name
    },
    public_subnet_a = {
      cidr_block              = var.development_public_subnet_a_cidr_block
      az                      = var.development_public_subnet_a_az
      map_public_ip_on_launch = true
      name                    = var.development_public_subnet_a_name
    },
    public_subnet_b = {
      cidr_block              = var.development_public_subnet_b_cidr_block
      az                      = var.development_public_subnet_b_az
      map_public_ip_on_launch = true
      name                    = var.development_public_subnet_b_name
    },
    private_subnet = {
      cidr_block              = var.development_private_subnet_cidr_block
      az                      = var.development_private_subnet_az
      map_public_ip_on_launch = false
      name                    = var.development_private_subnet_name
    }
  }
}

module "nat_getaway" {
  
  source = "../../modules/nat"

  module_nat_geteway_name     = var.development_nat_geteway_name
  module_nat_geteway_ip_name  = var.development_nat_geteway_ip_name
  module_subnet_id            = module.subnets.development_private_subnet_name
}

module "bastion_subnet_security_groups" {
  
  source = "../../modules/security_group"

  module_security_group_name = var.development_proxy_security_group_name
  module_vpc_id = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.39.0/24"]
      description = "SSH"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS"
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = [var.development_cidr_block]  # or your VPC CIDR
      description = "Allow ICMP (ping) from within VPC"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all"
    }
  ]

  tags = {
    Name = var.development_proxy_server_tag_name
    Environment = var.development_proxy_server_tag_environment
  }
}

