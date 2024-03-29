variable "vpc_id" {
  type        = string
  description = "An ID for VPC of the environment"
}
variable "common_tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}
variable "project_name_prefix" {
  type        = string
  description = ""
}
variable "name" {
  type        = string
  description = "An Name for Route Table of the environment"
}
variable "subnet_cidr_block" {
  type        = list(string)
  description = "Subnet CIDR Block"
}
variable "availability_zones" {
  type        = list(string)
  description = "Availability zones of current region"
}
variable "is_public" {
  type        = bool
  description = "A boolean flag to enable/disable Public access for Route Table"
}
