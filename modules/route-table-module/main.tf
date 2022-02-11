module "route_table_public" {
    count      = var.is_public ? 1 : 0
    source     = "../route-table/public"
    vpc_id     = var.vpc_id
    cidr_block = var.cidr_block
    gateway_id = var.internet_gateway_id
    tags       = merge(var.common_tags, tomap({
        "Name" : "${var.project_name_prefix}-${var.name}"
    }))
}

module "route_table_private" {
    count      = var.is_public ? 0 : 1
    source     = "../route-table/private"
    vpc_id     = var.vpc_id
    cidr_block = var.cidr_block
    gateway_id = var.nat_gateway_id
    tags       = merge(var.common_tags, tomap({
        "Name" : "${var.project_name_prefix}-${var.name}"
    }))
}
