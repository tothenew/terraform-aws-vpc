module "vpc_main" {
    source               = "./modules/vpc"
    cidr_block           = var.cidr_block
    enable_dns_hostnames = true
    tags                 = merge(local.common_tags, tomap({
        "Name" : local.project_name_prefix
    }))
}

module "subnet_main" {
    depends_on              = [module.vpc_main]
    for_each                = local.subnet_cidr_blocks
    source                  = "./modules/subnets"
    vpc_id                  = module.vpc_main.vpc_id
    cidr_block              = lookup(each.value, "cidr_block", "undefined")
    availability_zone       = lookup(each.value, "availability_zone", "undefined")
    map_public_ip_on_launch = lookup(each.value, "is_private", false)
    tags                    = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-${each.key}"
    }))
}

module "internet_gateway" {
    depends_on = [module.vpc_main]
    source     = "./modules/internet-gateway"
    vpc_id     = module.vpc_main.vpc_id
    tags       = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-internet-gateway"
    }))
}

module "elastic_ip" {
    source = "./modules/elastic-ip"
    tags   = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-elastic-ip"
    }))
}

module "nat_gateway" {
    depends_on    = [module.subnet_main, module.elastic_ip]
    source        = "./modules/nat-gateway"
    allocation_id = module.elastic_ip.eip_id
    subnet_id     = lookup(tomap({for k, bd in module.subnet_main : k => bd.subnet_id}), "public1", "undefined")
    tags          = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-nat-gateway"
    }))
}

module "public_route_table" {
    depends_on = [module.vpc_main, module.internet_gateway]
    source     = "./modules/route-table/public"
    vpc_id     = module.vpc_main.vpc_id
    cidr_block = "0.0.0.0/0"
    gateway_id = module.internet_gateway.internet_gateway_id
    tags       = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-public"
    }))
}

module "private_route_table" {
    depends_on = [module.vpc_main, module.nat_gateway]
    source     = "./modules/route-table/private"
    vpc_id     = module.vpc_main.vpc_id
    cidr_block = "0.0.0.0/0"
    gateway_id = module.nat_gateway.nat_gateway_id
    tags       = merge(local.common_tags, tomap({
        "Name" : "${local.project_name_prefix}-private"
    }))
}

module "route_table_association" {
    depends_on     = [
        module.subnet_main, module.private_route_table,
        module.public_route_table
    ]
    for_each       = local.subnet_cidr_blocks
    source         = "./modules/route-table-association"
    subnet_id      = lookup(tomap({for k, bd in module.subnet_main : k => bd.subnet_id}), each.key, "undefined")
    route_table_id = lookup(each.value, "is_private", false) ? module.private_route_table.route_table_id : module.public_route_table.route_table_id
}
