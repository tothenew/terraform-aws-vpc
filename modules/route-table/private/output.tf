output "route_table_id" {
	value = var.nat_gateway ? aws_route_table.route_table_private[0].id : aws_route_table.route_table_private_wo_nat[0].id
}
