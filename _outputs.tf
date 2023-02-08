output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}

output "subnet_details_id" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].subnet_details_id : module.subnet_advance[0].subnet_details_id
}

output "subnet_details_cidr" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].subnet_details_cidr : module.subnet_advance[0].subnet_details_cidr
}

output "internet_gateway_id" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].internet_gateway_id : module.subnet_advance[0].internet_gateway_id
}

output "route_table_id" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].route_table_id : module.subnet_advance[0].route_table_id
}

output "eip_id" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].route_table_id : module.subnet_advance[0].route_table_id
}

output "subnet_ids" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].subnet_ids : module.subnet_advance[0].subnet_ids
}

output "subnet_cidr" {
  value = length(var.subnet) == 0 ? module.subnet_simple[0].subnet_cidr : module.subnet_advance[0].subnet_cidr
}
