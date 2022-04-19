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