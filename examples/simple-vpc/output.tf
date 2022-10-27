output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}

output "subnet_details_id" {
  value = module.vpc_main.subnet_details_id
}

output "subnet_details_cidr" {
  value = module.vpc_main.subnet_details_cidr
}

output "internet_gateway_id" {
  value = module.vpc_main.internet_gateway_id
}

output "route_table_id" {
    value = module.vpc_main.route_table_id
}

output "subnet_ids" {
    value = module.vpc_main.route_table_id
}

output "subnet_cidr" {
    value = module.vpc_main.route_table_id
}
