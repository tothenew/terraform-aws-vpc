module "vpc_main" {
  source     = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v0.1.0"
  cidr_block = "10.0.0.0/16"
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
    "private" = {
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
}
