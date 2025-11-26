resource "aws_subnet" "this" {
  for_each = var.module_subnets

  vpc_id                  = var.module_vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = each.value.name
  }
}

