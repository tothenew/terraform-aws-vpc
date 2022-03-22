variable "cidr_block" {
    description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
    type        = string
}
variable "vpc_id" {
    description = "An ID for VPC of the environment"
    type        = string
}
variable "gateway_id" {
    type        = string
    description = "ID of VPN Gateway to attach to the VPC"
}
variable "tags" {
    type        = map(string)
    description = "A map of tags to add to all resources"
}