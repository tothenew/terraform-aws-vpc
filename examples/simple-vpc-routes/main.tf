module "vpc_main" {
  source               = "git::https://github.com/tothenew/terraform-aws-vpc.git"
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  region               = var.region
  subnet               = var.subnet
  project_name_prefix  = var.project_name_prefix
  common_tags          = var.common_tags

  # Below lines added after VPC has been created successfully
  create_peering_routes = true
  routes                = var.routes
}
