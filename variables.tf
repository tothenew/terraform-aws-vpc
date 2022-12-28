variable "region" {
  type        = string
  description = "A string value for Launch resources in which AWS Region"
}

variable "cidr_block" {
  type        = string
  description = "IPV4 range for VPC Creation"
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

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
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
  default     = false
}

variable "routes" {
  description = "Route details having destination and target address"
  type = map(object({
    peering = map(string)
  }))
  default = {}
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}
