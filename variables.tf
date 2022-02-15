variable "region" {
    type    = string
    default = "us-west-2"
}

variable "cidr_block" {
    type        = string
    default     = "10.0.0.0/16"
    description = "IPV4 range for VPC Creation"
}

variable "subnet" {
    type = map(object({
        is_public = bool
        details   = list(object({
            availability_zone = string
            cidr_address      = string
        }))
    }))
    default = {
        "public" = {
            is_public = true
            details   = [
                {
                    availability_zone = "a"
                    cidr_address      = "10.0.0.0/18"
                }
            ]
        }
        "public-new" = {
            is_public = true
            details   = [
                {
                    availability_zone = "b"
                    cidr_address      = "10.0.64.0/18"
                }
            ]
        }
        "application" = {
            is_public = false
            details   = [
                {
                    availability_zone = "a"
                    cidr_address      = "10.0.128.0/18"
                },
                {
                    availability_zone = "b"
                    cidr_address      = "10.0.192.0/18"
                }
            ]
        }
    }
}

variable "enable_dns_support" {
    default     = true
    description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
    default     = false
    description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}
