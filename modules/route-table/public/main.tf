resource "aws_route_table" "route_table_public" {
	vpc_id = var.vpc_id
	route {
		cidr_block = var.cidr_block
		gateway_id = var.gateway_id
	}
	tags   = var.tags
}