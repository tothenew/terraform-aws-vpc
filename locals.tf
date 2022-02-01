locals {
	common_tags = {
		Project     = "Terraform"
		Environment = "dev"
	}

	addrs_by_idx        = cidrsubnets(var.cidr_block, var.subnet[*].new_bits...)
	addrs_by_name       = {for i, n in var.subnet : n.name => {
		cidr_block        = local.addrs_by_idx[i]
		availability_zone = "${var.region}${n.availability_zone}"
	}}
	subnet_cidr_blocks = tomap(local.addrs_by_name)
}
