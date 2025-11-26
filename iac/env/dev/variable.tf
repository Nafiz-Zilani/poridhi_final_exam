#############Provider Module Variables#############

variable "development_aws_region" {
  description = "AWS region for development environment"
  type        = string
  default     = "ap-southeast-1"
}

#############VPC Module Variables#############

variable "development_vpc_name" {
  description = "Name of the VPC in development environment"
  type        = string
  default     = "dev-vpc"
}

variable "development_cidr_block" {
  description = "CIDR block for the VPC in development environment"
  type        = string
  default     = "10.0.0.0/16"
}

variable "development_instance_tenancy" {
  description = "Instance tenancy for the VPC in development environment"
  type        = string
  default     = "default"
}

variable "development_enable_dns_support" {
  description = "Enable DNS support for the VPC in development environment"
  type        = bool
  default     = true
}

variable "development_enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC in development environment"
  type        = bool
  default     = true
}

variable "development_internet_gateway_name" {
  description = "Name of the Internet Gateway in development environment"
  type        = string
  default     = "dev-igw"
}

#############Subnet Module Variables#############

variable "development_bastion_subnet_cidr_block" {
  description = "CIDR block for the bastion subnet"
  type        = string
}

variable "development_bastion_subnet_az" {
  description = "Availability zone for the bastion subnet"
  type        = string
}

variable "development_bastion_subnet_name" {
  description = "Name of the bastion subnet"
  type        = string
}

variable "development_public_subnet_a_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "development_public_subnet_a_az" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "development_public_subnet_a_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "development_public_subnet_b_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "development_public_subnet_b_az" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "development_public_subnet_b_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "development_private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "development_private_subnet_az" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "development_private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}