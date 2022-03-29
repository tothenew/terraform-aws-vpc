variable "cidr_block" {
    type        = string
    description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
}
variable "vpc_id" {
    type        = string
    description = "An ID for VPC of the environment"
}
variable "availability_zone" {
    type        = string
    description = "A list of availability zones names or ids in the region"
}
variable "tags" {
    type        = map(string)
    description = "A map of tags to add to all resources"
}
variable "map_public_ip_on_launch" {
    type        = bool
    description = "Should be false if you do not want to auto-assign public IP on launch"
}