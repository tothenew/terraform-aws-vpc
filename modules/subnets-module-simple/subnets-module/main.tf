module "subnet_module" {
  count                   = length(var.subnet_cidr_block)
  source                  = "../../subnets"
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = var.is_public
  tags = merge(var.common_tags, tomap({
    "Name" : "${var.project_name_prefix}-${var.name}-${count.index + 1}"
  }))
}
