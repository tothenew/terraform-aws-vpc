variable "cidr_block" {
    type        = string
    description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
}
variable "enable_dns_hostnames" {
    type        = bool 
    description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}
variable "tags" {
    type        = map(string)
    description = "A map of tags to add to all resources"
}
variable "enable_dns_support" {
    type        = bool
    description = "A boolean flag to enable/disable DNS support in the VPC"
}
