variable "m_domain_name" {
  description = "The domain name for the NAT gateway"
  type        = string
  default     = "vpc"
}

variable "m_nat_geteway_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "m_nat_geteway_ip_name" {
  description = "The name of the NAT gateway IP"
  type        = string
}

variable "m_subnet_id" {
  description = "The ID of the subnet to create the NAT gateway in"
  type        = string
}