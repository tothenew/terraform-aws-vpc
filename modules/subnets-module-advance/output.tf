output "subnet_details_id" {
  value = tomap({ for k, bd in module.subnets_module_advance : k => bd.subnet_id })
}

output "subnet_details_cidr" {
  value = tomap({ for k, bd in module.subnets_module_advance : k => bd.subnet_cidr })
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
  value = { for k, bd in module.subnets_module_advance : k => values(bd.subnet_id) }
}

output "subnet_cidr" {
  value = { for k, bd in var.subnet : k => bd.details.*.cidr_address }
}

output "private_subnet_name" {
  value = [for subnet_name, subnet_detail in var.subnet : subnet_name if subnet_detail.nat_gateway == true][0]
}
