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

