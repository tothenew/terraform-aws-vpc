output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}

output "subnet_ids" {
  value = tomap({ for k, bd in module.subnet_main : k => bd.subnet_id })
}

output "network_cidr_blocks" {
  value = local.subnet_cidr_blocks
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "public_route_table_id" {
  value = module.public_route_table.route_table_id
}

output "private_route_table_id" {
  value = module.private_route_table.route_table_id
}

output "eip_id" {
  value = module.elastic_ip.eip_id
}

output "subnet_cidr" {
  value = tomap({ for k, bd in local.subnet_cidr_blocks : k => lookup(bd, "cidr_block", "undefined") })
}
