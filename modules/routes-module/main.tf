module "route_peering" {
    source         = "../routes"
    for_each       = var.routes
    route_table_id = lookup(var.route_table_ids, each.key, null)
    peering_routes = lookup(each.value, "peering", null)
}
