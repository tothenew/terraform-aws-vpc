resource "aws_route_table" "route_table_private" {
    count  = var.nat_gateway ? 1 : 0
    vpc_id = var.vpc_id
    route {
        cidr_block     = var.cidr_block
        nat_gateway_id = var.gateway_id
    }
    lifecycle {
        ignore_changes = [
            vpc_id,
            route,
        ]
    }
    tags = var.tags
}

resource "aws_route_table" "route_table_private_wo_nat" {
    count  = var.nat_gateway ? 0 : 1
    vpc_id = var.vpc_id
    lifecycle {
        ignore_changes = [
            vpc_id,
            route,
        ]
    }
    tags = var.tags
}
