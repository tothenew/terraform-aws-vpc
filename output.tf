output "vpc_id" {
    value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
    value = var.cidr_block
}

output "subnet_details_id" {
    value = tomap({for k, bd in module.subnet_main : k => bd.subnet_id})
}

output "subnet_details_cidr" {
    value = tomap({for k, bd in module.subnet_main : k => bd.subnet_cidr})
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

output "subnet_ids" {
    value = {for k, bd in module.subnet_main : k => values(bd.subnet_id)}
}

output "subnet_cidr" {
    value = {for k, bd in var.subnet : k => bd.details.*.cidr_address}
}
