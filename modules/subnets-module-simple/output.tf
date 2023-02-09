output "subnet_details_id" {
  value = tomap({ for k, bd in module.subnets_module_simple : k => bd.subnet_id })
}

output "subnet_details_cidr" {
  value = tomap({ for k, bd in module.subnets_module_simple : k => bd.subnet_cidr })
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "route_table_id" {
  value = tomap({ for k, bd in module.route_table : k => bd.route_table_id })
}

output "eip_id" {
  value = module.elastic_ip.eip_id
}

output "subnet_ids" {
  value = { for k, bd in module.subnets_module_simple : k => values(bd.subnet_id) }
}

output "subnet_cidr" {
  value = local.subnet_group_cidr_blocks
}

output "private_subnet_name" {
  value = [for subnet_name, subnet_detail in var.subnet_group : subnet_name if subnet_detail.nat_gateway == true][0]
}
