variable "route_table_id" {
  type        = string
  description = "Route Table Id"
}

variable "peering_routes" {
  type        = map(string)
  description = "Route table routes of the peering"
}
