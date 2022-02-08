resource "aws_vpc" "vpc_main" {
	cidr_block           = var.cidr_block
	enable_dns_hostnames = var.enable_dns_hostnames
	tags                 = var.tags
}