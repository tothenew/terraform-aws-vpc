variable "region" {
    type        = string
    description = "Region Name"
}

variable "cidr_block" {
    type        = string
    description = "IPV4 range for VPC Creation"
}

variable "subnet" {
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
    description = "A string value to describe project name prefix"
}

variable "common_tags" {
    type        = map(string)
    description = "A map to add common tags to all the resources"
}

variable "Project" {
    type        = string
    description = "Project Name"
}

variable "Environment" {
    type        = string
    description = "Environment Name"
}
