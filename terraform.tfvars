cidr_block              =   "10.0.0.0/16"
enable_dns_support      =   false
enable_dns_hostnames    =   false
region                  =   "us-west-2"

subnet = {
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

project_name_prefix = "testing"

common_tags = {}

Project = "testing"

Environment = "dev"
