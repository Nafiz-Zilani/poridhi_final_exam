variable "module_security_group_name" {
  description = "Name of the security group"
  type        = string
  
}

variable "module_vpc_id" {
  description = "VPC ID"
  type        = string
  
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "ingress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
  default = []
}

variable "egress_rules" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
  }))
  default = []
}
