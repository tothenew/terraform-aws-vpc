# Overriding Default configuration will create 3 private and 3 public VPC Subnets

module "vpc_main" {
  source        = "git::https://github.com/tothenew/terraform-aws-vpc.git"
  cidr_block    = "10.1.0.0/16"
  subnet_bits   = 8
  max_subnet_az = 3
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
}
