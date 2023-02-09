# Overriding Default configuration will create 3 private and 3 public VPC Subnets

module "vpc_main" {
  source        = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v0.2.0"
  cidr_block    = "10.1.0.0/16"
  subnet_bits   = 8
  max_subnet_az = 2
  subnet_group = {
    "private" = {
      is_public   = false
      nat_gateway = true
    },
    "public" = {
      is_public   = true
      nat_gateway = false
    }
  }
  additional_subnet_group = {
    "database" = {
      is_public   = false
      nat_gateway = false
      details = [
        {
          availability_zone = "a"
          cidr_address      = "10.1.4.0/24"
        },
        {
          availability_zone = "b"
          cidr_address      = "10.1.5.0/24"
        }
      ]
    }
  }
}
