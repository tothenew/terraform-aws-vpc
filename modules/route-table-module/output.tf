output "route_table_id" {
    value = var.is_public ? module.route_table_public[0].route_table_id : module.route_table_private[0].route_table_id
}
