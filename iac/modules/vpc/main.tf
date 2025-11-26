resource "aws_vpc" "this" {
  cidr_block       = var.module_cidr_block
  instance_tenancy = var.module_instance_tenancy
  enable_dns_support = var.module_enable_dns_support
  enable_dns_hostnames = var.module_enable_dns_hostnames

  tags = {
    Name = var.module_vpc_name
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.module_internet_gateway_name
  }
}