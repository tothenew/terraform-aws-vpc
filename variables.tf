variable "region" {
  type        = string
  description = "A string value for Launch resources in which AWS Region"
}

variable "cidr_block" {
  type        = string
  description = "IPV4 range for VPC Creation"
}

variable "subnet" {
  description = "Subnet details having zone and cidr address"
  type = map(object({
    is_public   = bool
    nat_gateway = bool
    details = list(object({
      availability_zone = string
      cidr_address      = string
    }))
  }))
}

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
}

variable "project_name_prefix" {
  type        = string
  description = "A string value to describe prefix of all the resources"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
}

variable "create_peering_routes" {
  type        = bool
  description = "True/False value need to create Peering Route or not, Default to false"
  default     = false
}

variable "routes" {
  description = "Route details having destination and target address"
  type = map(object({
    peering = map(string)
  }))
  default = {}
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs."
  type        = number
  default     = 7
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs."
  type        = string
  default     = "cloud-watch-logs"
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
  type        = string
  default     = "ALL"
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 600
}
