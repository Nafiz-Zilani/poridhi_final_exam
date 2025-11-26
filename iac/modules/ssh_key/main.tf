resource "aws_key_pair" "this" {
  key_name   = var.m_key_name
  public_key = var.m_public_key
}