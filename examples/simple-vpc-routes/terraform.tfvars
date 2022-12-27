region               = "ap-south-1"
cidr_block           = "10.0.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true

subnet = {
  "public" = {
    is_public   = true
    nat_gateway = false
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.0.0.0/19"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.0.32.0/19"
      }
    ]
  }
  "database" = {
    is_public   = false
    nat_gateway = false
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.0.64.0/18"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.0.128.0/18"
      }
    ]
  }
  "application" = {
    is_public   = false
    nat_gateway = true
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.0.192.0/19"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.0.224.0/19"
      }
    ]
  }
}

project_name_prefix = "dev-tothenew"

common_tags = {
  "Feature" : "application"
  "Project" : "ToTheNew"
  "Environment" : "dev"
}

routes = {
  "application" = {
    peering = {
      "10.10.0.0/16" : "pcx-123456789"
      "20.10.0.0/16" : "pcx-987654321"
    }
  }
}
