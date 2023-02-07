module "subnet_advance" {
  count               = length(var.subnet) != 0 ? 1 : 0
  depends_on          = [module.vpc_main]
  source              = "./modules/subnets-module-advance"
  vpc_id              = module.vpc_main.vpc_id
  subnet              = var.subnet
  common_tags         = local.common_tags
  project_name_prefix = local.project_name_prefix
  region_name         = data.aws_region.current.name
}
