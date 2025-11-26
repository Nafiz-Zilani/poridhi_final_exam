variable "m_assign_eip" {
  description = "Whether to assign an Elastic IP to the EC2 instance"
  type        = bool
  default     = false
}

variable "m_instance_id" {
  description = "The ID of the EC2 instance to associate the Elastic IP with"
  type        = string
}

variable "m_domain" {
  description = "The Elastic IP address"
  type        = string
  # default     = true
}

variable "m_eip_name" {
  description = "The Elastic IP address"
  type        = string
}