module "vpc_main" {
  source      = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v0.1.0"
  cidr_block  = "10.1.0.0/16"
  subnet_bits = 8
}
