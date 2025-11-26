resource "aws_eip" "this" {
    
  count    = var.m_assign_eip ? 1 : 0
  instance = var.m_instance_id
  domain   = var.m_domain

  tags = {
    Name = var.m_eip_name
  }
}