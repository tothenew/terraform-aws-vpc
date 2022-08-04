output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}

output "subnet_ids" {
  value = module.vpc_main.subnet_ids
}

output "internet_gateway_id" {
  value = module.vpc_main.internet_gateway_id
}

output "route_table_id" {
    value = module.vpc_main.route_table_id
}
