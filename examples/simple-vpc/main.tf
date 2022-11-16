module "vpc_main" {
    source               = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v1.0.0"
    cidr_block           = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support   = var.enable_dns_support
    region               = var.region
    profile              = var.profile
    subnet               = var.subnet
    project_name_prefix  = var.project_name_prefix
    common_tags          = var.common_tags
    project              = var.project
    environment          = var.environment
}
