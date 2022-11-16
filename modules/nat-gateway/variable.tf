variable "allocation_id" {
  type        = string
  description = ""
}
variable "subnet_id" {
  type        = string
  description = "A list of Subnete id associated with VPC"
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}