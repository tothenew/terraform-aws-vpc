module "route_table_association" {
    for_each       = var.subnet_ids
    source         = "../route-table-association"
    subnet_id      = each.value
    route_table_id = var.route_table_id
}
