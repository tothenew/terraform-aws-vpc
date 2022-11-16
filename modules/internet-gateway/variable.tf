variable "vpc_id" {
  type        = string
  description = "An ID for VPC of the environment"
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}