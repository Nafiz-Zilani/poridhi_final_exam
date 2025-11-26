resource "aws_eip" "this" {
  domain = var.m_domain_name

  tags = {
    Name = var.m_nat_geteway_ip_name
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.m_subnet_id

  tags = {
    Name = var.m_nat_geteway_name
  }
}