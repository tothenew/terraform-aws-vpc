variable "vpc_id" {
  type        = string
  description = "VPC ID of Network"
}

variable "region_name" {
  type        = string
  description = "Region Name"
}

variable "subnet" {
  description = "Subnet details having zone and cidr address"
  type = map(object({
    is_public   = bool
    nat_gateway = bool
    details = list(object({
      availability_zone = string
      cidr_address      = string
    }))
  }))
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
