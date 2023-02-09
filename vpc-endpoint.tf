module "vpc_endpoint" {
  count               = var.create_vpc_endpoint ? 1 : 0
  source              = "git::https://github.com/tothenew/terraform-aws-vpc-endpoint.git?ref=v0.1.0"
  project_name_prefix = local.project_name_prefix
  common_tags         = local.common_tags
  vpc_id              = module.vpc_main.vpc_id
  subnet_ids          = length(var.subnet) == 0 ? lookup(module.subnet_simple[0].subnet_ids, module.subnet_simple[0].private_subnet_name, []) : lookup(module.subnet_advance[0].subnet_ids, module.subnet_advance[0].private_subnet_name, [])
  route_table_ids     = length(var.subnet) == 0 ? [lookup(module.subnet_simple[0].route_table_id, module.subnet_simple[0].private_subnet_name, "")] : [lookup(module.subnet_advance[0].route_table_id, module.subnet_advance[0].private_subnet_name, "")]
}
