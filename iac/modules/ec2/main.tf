resource "aws_instance" "this" {
  ami                    = var.m_ec2_ami_id
  instance_type          = var.m_ec2_instance_type
  subnet_id              = var.m_ec2_subnet_id
  associate_public_ip_address = var.m_ec2_associate_public_ip
  key_name               = var.m_ec2_key_name
  vpc_security_group_ids = var.m_ec2_security_group_ids
  private_ip             = var.m_private_ip

  root_block_device {
    volume_size = var.m_volume_size                     # Size in GB
    volume_type = var.m_volume_type                     # gp2, gp3, io1, sc1, etc.
    delete_on_termination = var.m_delete_on_termination # Auto delete when instance is deleted
  }

  # dynamic "ebs_block_device" {
  #   for_each = var.m_extra_ebs_enabled ? [var.extra_ebs_config] : []

  #   # content {
  #   #   device_name           = ebs_block_device.value.device_name
  #   #   volume_size           = ebs_block_device.value.volume_size
  #   #   volume_type           = ebs_block_device.value.volume_type
  #   #   delete_on_termination = ebs_block_device.value.delete_on_termination
  #   # }

  #   content {
  #     device_name           = var.m_ec2_name
  #     volume_size           = var.m_ebs_volume_size
  #     volume_type           = var.m_ebs_volume_type
  #     delete_on_termination = var.m_delete_on_termination
  #   }
  # }

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = {
    Name = var.m_ec2_name
  }
}
