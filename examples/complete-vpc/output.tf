output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = "10.0.0.0/16"
}

output "subnet_ids" {
  value = tomap({ for k, bd in module.subnet_main : k => bd.subnet_id })
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "route_table_id" {
    value = tomap({for k, bd in module.route_table : k => bd.route_table_id})
}

output "eip_id" {
  value = module.elastic_ip.eip_id
}
