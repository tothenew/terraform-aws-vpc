variable "region" {
    type        = string
    description = "A string value for Launch resources in which AWS Region"
}

variable "profile" {
    type        = string
    description = "A string value for setting AWS Profile"
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
        details     = list(object({
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

variable "project" {
    type        = string
    description = "A string value for tag as Project Name"
}

variable "environment" {
    type        = string
    description = "A string value for tag as Environment Name"
}


