variable "m_ec2_ami_id" {
  description = "AMI ID"
  type        = string
  
}

variable "m_ec2_instance_type" {
  description = "Instance type"
  type        = string
  
}

variable "m_ec2_subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "m_ec2_associate_public_ip" {
  description = "Associate public IP address"
  type        = bool
  default     = false
  
}

variable "m_ec2_key_name" {
  description = "Key name for SSH access"
  type        = string
  
}

variable "m_ec2_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
  
}

variable "m_ec2_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default = "value"
}

variable "m_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 20
}

variable "m_volume_type" {
  description = "Type of the root volume"
  type        = string
  default     = "gp3"
}

variable "m_delete_on_termination" {
  description = "value of delete_on_termination"
  type        = bool
  default     = true
}

# variable "m_extra_ebs_enabled" {
#   description = "Enable extra EBS volume"
#   type        = bool
#   default     = false
  
# }

# variable "extra_ebs_config" {
#   description = "Extra EBS volume configuration"
#   type = object({
#     device_name           = string
#     volume_size           = number
#     volume_type           = string
#     delete_on_termination = bool
#   })
#   default = {
#     device_name           = "/dev/sdf"
#     volume_size           = 20
#     volume_type           = "gp3"
#     delete_on_termination = true
#   }
# }

# variable "m_ebs_block_device_name" {
#   description = "EBS block device name"
#   type        = string
# }

# variable "m_ebs_volume_size" {
#   description = "EBS volume size in GB"
#   type        = number
#   default     = 20
# }

# variable "m_ebs_volume_type" {
#   description = "EBS volume type"
#   type        = string
#   default     = "gp3"
# }

# variable "m_ebs_delete_on_termination" {
#   description = "EBS delete on termination"
#   type        = bool
#   default     = true
# }

variable "m_private_ip" {
  description = "Private IP address"
  type        = string
}