############################VPC##################################
variable "module_vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "module_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "module_instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "module_enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "module_enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

##############################IGW##################################
variable "module_internet_gateway_name" {
  description = "Name of the Internet Gateway"
  type        = string
}