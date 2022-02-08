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
        availability_zone = string
        is_private        = bool
        new_bits          = number
    }))
    default     = {
        "public1" = {
            availability_zone = "a"
            is_private        = false
            new_bits          = 2
        }
        "public2" = {
            availability_zone = "b"
            is_private        = false
            new_bits          = 2
        }
        "private1" = {
            availability_zone = "a"
            is_private        = true
            new_bits          = 2
        }
        "private2" = {
            availability_zone = "b"
            is_private        = true
            new_bits          = 2
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
