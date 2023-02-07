module "vpc_main" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(local.common_tags, tomap({
    "Name" : local.project_name_prefix
  }))
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr_blocks" {
  count      = length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0
  vpc_id     = module.vpc_main.vpc_id
  cidr_block = element(var.secondary_cidr_blocks, count.index)
}
