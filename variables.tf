variable "region" {
    type = string
    default = "us-west-2"
}

variable "cidr_block" {
	type = string
    default = "10.0.0.0/16"
    description = "IPV4 range for VPC Creation"

}

variable "subnet" {
	type    = list(object({
		name              = string,
		availability_zone = string
		new_bits          = number
	}))
    description = <<-EOT
                    Provide the subnet details as per the requirement.
                    It requires the name, AZ and new_bits to create the subnet
                    new_bits value will calculate the CIDR range of subnet.
            EOT
	default = [
		{
			name              = "public1"
			availability_zone = "a"
            is_private = false
			new_bits          = 8
		},
		{
			name              = "public2"
			availability_zone = "b"
            is_private = false
			new_bits          = 8
		},
        {
            name              = "public3"
            availability_zone = "c"
            is_private = false
            new_bits          = 8
        },
        {
            name              = "private1"
            availability_zone = "a"
            is_private = true
            new_bits          = 7
        },
        {
            name              = "private2"
            availability_zone = "b"
            is_private = true
            new_bits          = 7
        },
        {
            name              = "private3"
            availability_zone = "c"
            is_private = true
            new_bits          = 7
        },
        {
            name              = "database1"
            availability_zone = "a"
            is_private = true
            new_bits          = 9
        },
        {
            name              = "database2"
            availability_zone = "b"
            is_private = true
            new_bits          = 9
        },
        {
            name              = "database3"
            availability_zone = "c"
            is_private = true
            new_bits          = 9
        }
	]
}

variable "enable_dns_support" {
    default = true
    description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
    default = false
    description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}
