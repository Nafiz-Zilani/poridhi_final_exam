resource "aws_eip" "this" {
  domain = var.module_domain_name

  tags = {
    Name = var.module_nat_geteway_ip_name
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.module_subnet_id

  tags = {
    Name = var.module_nat_geteway_name
  }
}