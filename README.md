# terraform-aws-vpc

[![Lint Status](https://github.com/tothenew/terraform-aws-vpc/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-vpc/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-vpc)](https://github.com/tothenew/terraform-aws-vpc/blob/master/LICENSE)

This module creates the basic and advance network resources for a region.

The following resources will be created:
- Virtual Private Cloud (VPC)
- VPC Flow Logs
- AWS Cloudwatch log groups
- Subnets
  - Public
  - Private
  - Database
- Internet Gateway
- Nat Gateway
- Route tables for the Public, Private, Database subnets
- Associate all Route Tables created to the correct subnet
- Database Subnet group - Provides an RDS DB subnet group resources without Internet
- Adding routes in Route Table for VPC Peering

## Usages
```
module "vpc_main" {
  source      = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v0.1.0"
  cidr_block  = "10.1.0.0/16"
  subnet_bits = 8
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet_advance"></a> [subnet\_advance](#module\_subnet\_advance) | ./modules/subnets-module-advance | n/a |
| <a name="module_subnet_simple"></a> [subnet\_simple](#module\_subnet\_simple) | ./modules/subnets-module-simple | n/a |
| <a name="module_vpc_endpoint"></a> [vpc\_endpoint](#module\_vpc\_endpoint) | git::https://github.com/tothenew/terraform-aws-vpc-endpoint.git | v0.1.0 |
| <a name="module_vpc_main"></a> [vpc\_main](#module\_vpc\_main) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_policy.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_vpc_ipv4_cidr_block_association.secondary_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy_document.flow_log_cloudwatch_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_subnet_group"></a> [additional\_subnet\_group](#input\_additional\_subnet\_group) | Subnet details having zone and cidr address | <pre>map(object({<br>    is_public   = bool<br>    nat_gateway = bool<br>    details = list(object({<br>      availability_zone = string<br>      cidr_address      = string<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | IPV4 range for VPC Creation | `string` | `"10.20.0.0/20"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map to add common tags to all the resources | `map(string)` | `{}` | no |
| <a name="input_create_peering_routes"></a> [create\_peering\_routes](#input\_create\_peering\_routes) | True/False value need to create Peering Route or not, Default to false | `bool` | `false` | no |
| <a name="input_create_vpc_endpoint"></a> [create\_vpc\_endpoint](#input\_create\_vpc\_endpoint) | Create all VPC Endpoint | `bool` | `false` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map to add common tags to all the resources | `map(string)` | <pre>{<br>  "CreatedBy": "Terraform",<br>  "Scope": "VPC"<br>}</pre> | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | A boolean flag to enable/disable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log) | Whether or not to enable VPC Flow Logs | `bool` | `false` | no |
| <a name="input_flow_log_cloudwatch_log_group_retention_in_days"></a> [flow\_log\_cloudwatch\_log\_group\_retention\_in\_days](#input\_flow\_log\_cloudwatch\_log\_group\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group for VPC flow logs. | `number` | `7` | no |
| <a name="input_flow_log_destination_type"></a> [flow\_log\_destination\_type](#input\_flow\_log\_destination\_type) | Type of flow log destination. Can be s3 or cloud-watch-logs. | `string` | `"cloud-watch-logs"` | no |
| <a name="input_flow_log_log_format"></a> [flow\_log\_log\_format](#input\_flow\_log\_log\_format) | The fields to include in the flow log record, in the order in which they should appear. | `string` | `null` | no |
| <a name="input_flow_log_max_aggregation_interval"></a> [flow\_log\_max\_aggregation\_interval](#input\_flow\_log\_max\_aggregation\_interval) | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds. | `number` | `600` | no |
| <a name="input_flow_log_traffic_type"></a> [flow\_log\_traffic\_type](#input\_flow\_log\_traffic\_type) | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |
| <a name="input_max_subnet_az"></a> [max\_subnet\_az](#input\_max\_subnet\_az) | Maximum number of Subnets per Availability Zone | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | A string value to describe prefix of all the resources | `string` | `""` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | Route details having destination and target address | <pre>map(object({<br>    peering = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_secondary_cidr_blocks"></a> [secondary\_cidr\_blocks](#input\_secondary\_cidr\_blocks) | List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool | `list(string)` | `[]` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet details having zone and cidr address | <pre>map(object({<br>    is_public   = bool<br>    nat_gateway = bool<br>    details = list(object({<br>      availability_zone = string<br>      cidr_address      = string<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_subnet_bits"></a> [subnet\_bits](#input\_subnet\_bits) | Number Bits required for creating Subnets | `number` | `8` | no |
| <a name="input_subnet_group"></a> [subnet\_group](#input\_subnet\_group) | Subnets group divided into public, private and database | <pre>map(object({<br>    is_public   = bool<br>    nat_gateway = bool<br>  }))</pre> | <pre>{<br>  "database": {<br>    "is_public": false,<br>    "nat_gateway": false<br>  },<br>  "private": {<br>    "is_public": false,<br>    "nat_gateway": true<br>  },<br>  "public": {<br>    "is_public": true,<br>    "nat_gateway": false<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eip_id"></a> [eip\_id](#output\_eip\_id) | n/a |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | n/a |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | n/a |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | n/a |
| <a name="output_subnet_details_cidr"></a> [subnet\_details\_cidr](#output\_subnet\_details\_cidr) | n/a |
| <a name="output_subnet_details_id"></a> [subnet\_details\_id](#output\_subnet\_details\_id) | n/a |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-vpc/blob/main/LICENSE) for full details.
