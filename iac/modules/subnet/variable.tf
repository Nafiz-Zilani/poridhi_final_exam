variable "module_subnets" {
  type = map(object({
    cidr_block              = string
    az                      = string
    map_public_ip_on_launch = bool
    name                    = string
  }))
}

variable "module_vpc_id" {
  description = "The ID of the VPC to create the subnet in"
  type        = string
}