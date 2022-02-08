locals {
    project_name_prefix = "testing"

    common_tags = {
        Project     = "Terraform"
        Environment = "dev"
    }

    subnet_bits      = {for bit, bit_value in var.subnet : bit => bit_value.new_bits}
    subnet_cidr_list = cidrsubnets(var.cidr_block, values(local.subnet_bits)...)
    subnet_cidr_map  = {for i, cidr in local.subnet_cidr_list : keys(local.subnet_bits)[i] => cidr}
    addrs_by_name    = {
    for i, n in var.subnet : i => {
        cidr_block        = local.subnet_cidr_map[i]
        availability_zone = "${var.region}${n.availability_zone}"
        is_private        = n.is_private
    }
    }
    subnet_cidr_blocks = tomap(local.addrs_by_name)
}
