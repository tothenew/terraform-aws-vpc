module "subnet_advance" {
  count      = length(var.subnet) != 0 ? 1 : 0
  depends_on = [module.vpc_main]
  source     = "./modules/subnets-module-advance"

  vpc_id = module.vpc_main.vpc_id
  subnet = var.subnet

  common_tags           = local.common_tags
  project_name_prefix   = local.project_name_prefix
  region_name           = data.aws_region.current.name
  create_peering_routes = var.create_peering_routes
  routes                = var.routes
}

module "subnet_simple" {
  count      = length(var.subnet) == 0 ? 1 : 0
  depends_on = [module.vpc_main]
  source     = "./modules/subnets-module-simple"

  vpc_id             = module.vpc_main.vpc_id
  cidr_block         = var.cidr_block
  subnet_bits        = var.subnet_bits
  max_subnet_az      = var.max_subnet_az
  subnet_group       = var.subnet_group
  availability_zones = data.aws_availability_zones.available.names

  common_tags           = local.common_tags
  project_name_prefix   = local.project_name_prefix
  region_name           = data.aws_region.current.name
  create_peering_routes = var.create_peering_routes
  routes                = var.routes
}
