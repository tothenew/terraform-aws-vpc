resource "aws_route_table" "route_table_private" {
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
	tags   = var.tags
}