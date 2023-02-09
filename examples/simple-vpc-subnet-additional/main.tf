# Overriding Default configuration will create 2 private and 2 public VPC Subnets,
# if user want to add additional Subnet in future by any name it will create by variable additional_subnet_group.

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
