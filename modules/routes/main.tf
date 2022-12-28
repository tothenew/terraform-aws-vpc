resource "aws_route" "aws_route_peering" {
  route_table_id            = var.route_table_id
  for_each                  = var.peering_routes
  destination_cidr_block    = each.key
  vpc_peering_connection_id = each.value
}
