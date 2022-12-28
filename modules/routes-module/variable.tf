variable "route_table_ids" {
  type        = map(string)
  description = "Map of subnet route table ids"
}

variable "routes" {
  type = map(object({
    peering = map(string)
  }))
  description = "Route details having destination and target address"
}
