variable "vpc_id" {
  type        = string
  description = "VPC ID of Network"
}

variable "cidr_block" {
  type        = string
  description = "IPV4 range for VPC Creation"
}

variable "subnet_bits" {
  type        = number
  description = "Number Bits required for creating Subnets"
}

variable "max_subnet_az" {
  type        = number
  description = "Maximum number of Subnets per Availability Zone"
}

variable "subnet_group" {
  type = map(object({
    is_public   = bool
    nat_gateway = bool
  }))
  description = "Subnets group divided into public, private and database"
}

variable "region_name" {
  type        = string
  description = "Region Name"
}

variable "project_name_prefix" {
  type        = string
  description = "A string value to describe prefix of all the resources"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}

variable "create_peering_routes" {
  type        = bool
  description = "True/False value need to create Peering Route or not, Default to false"
}

variable "routes" {
  description = "Route details having destination and target address"
  type = map(object({
    peering = map(string)
  }))
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones of current region"
}
