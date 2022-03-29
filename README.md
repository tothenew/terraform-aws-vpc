# terraform-aws-vpc

## VPC

This Terraform code snippet is used to launch a VPC with required subnets

## Requirements

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Terraform is [installed](#software-dependencies) on the machine where Terraform is executed.
2. Make sure you had access to launch the resources in aws.


### Software Dependencies
### Terraform
- [Terraform](https://www.terraform.io/downloads.html) 1.0.x



## Install

### Terraform
Be sure you have the correct Terraform version (1.0.x), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## File structure
The project has the following folders and files:

- /: Root folder
- /main.tf: Main file for this module, contains all the resources to create
- /provider.tf: File which will store the information about provider
- /variables.tf: All the variables for the module
- /output.tf: The outputs of the module
- /README.md: This file
- /locals.tf: All expressions to use in modules
- /terrafrom.tfvars: Varaible files
 
## Usage

## Step 1: Clone the repo
## Step 2: Then perform the following commands in the root folder:

- `terraform init` to get the plugins
- `terraform plan --var-file="terraform.tfvars"` to see the infrastructure plan
- `terraform apply --var-file="terraform.tfvars"` to apply the infrastructure build
- `terraform destroy --var-file="terraform.tfvars"` to destroy the built infrastructure

## Providers
| Name | Version |
|------|---------|
| aws  | 4.5.0 |

## Modules

| Name | Type |
|------|------|
| vpc_main  | module |
| subnet_main | module |
| internet_gateway | module |
| elastic_ip | module |
| nat_gateway | module |
| route_table | module |
| route_table_association | module |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr_block |  | `string` | 10.0.0.0/16 | yes |
| subnet |  | `map` | n/a | yes |
| enable_dns_support |  | `bool` | n/a | yes |
| enable_dns_hostnames |  | `bool` | n/a | yes |
| project_name_prefix |  | `string` | n/a | yes |
| common_tags |  | `map` | n/a | yes |
| Project |  | `string` | n/a | yes |
| Environment |  | `string` | n/a | yes |
