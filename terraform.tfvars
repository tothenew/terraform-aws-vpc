region               = "us-east-1"
cidr_block           = "10.20.0.0/20"
enable_dns_support   = true
enable_dns_hostnames = true

subnet = {
  "public" = {
    is_public   = true
    nat_gateway = false
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.20.0.0/26"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.20.0.64/26"
      },
      {
        availability_zone = "c"
        cidr_address      = "10.20.0.128/26"
      }
    ]
  }
  "database" = {
    is_public   = false
    nat_gateway = false
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.20.1.128/25"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.20.2.0/25"
      },
      {
        availability_zone = "c"
        cidr_address      = "10.20.2.128/25"
      }
    ]
  }
  "app-tools" = {
    is_public   = false
    nat_gateway = true
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.20.0.192/26"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.20.1.0/26"
      },
      {
        availability_zone = "c"
        cidr_address      = "10.20.1.64/26"
      }
    ]
  }
  "application" = {
    is_public   = false
    nat_gateway = true
    details = [
      {
        availability_zone = "a"
        cidr_address      = "10.20.4.0/22"
      },
      {
        availability_zone = "b"
        cidr_address      = "10.20.8.0/22"
      },
      {
        availability_zone = "c"
        cidr_address      = "10.20.12.0/22"
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
