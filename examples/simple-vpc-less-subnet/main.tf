# Overriding Default configuration will create 2 private and 2 public VPC Subnets

module "vpc_main" {
  source      = "git::https://github.com/tothenew/terraform-aws-vpc.git"
  cidr_block  = "10.1.0.0/16"
  subnet_bits = 8
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
