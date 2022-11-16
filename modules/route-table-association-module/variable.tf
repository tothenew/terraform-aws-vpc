variable "route_table_id" {
  type        = string
  description = "A list of Route Table id associated with VPC"
}
variable "subnet_ids" {
  type        = any
  description = "A list of Subnete id associated with VPC"
}
