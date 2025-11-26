variable "module_vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "module_route_table_name" {
  description = "Name tag for route table"
  type        = string
}

variable "module_subnet_ids" {
  description = "List of subnet IDs to associate"
  type        = list(string)
  default     = []
}

variable "module_routes" {
  description = "List of route blocks"
  type = list(object({
    cidr_block                 = string
    gateway_id                 = optional(string)
    nat_gateway_id             = optional(string)
    transit_gateway_id         = optional(string)
    egress_only_gateway_id     = optional(string)
    network_interface_id       = optional(string)
    vpc_peering_connection_id  = optional(string)
  }))
  default = []
}
