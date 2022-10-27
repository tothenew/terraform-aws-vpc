# terraform-aws-vpc

## VPC

This Terraform code snippet is used to launch a VPC with required subnets

## Requirements

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Terraform is [installed](#software-dependencies) on the machine where Terraform is executed.
2. Make sure you had access to launch the resources in aws.


### Software Dependencies
## Terraform
- [Terraform](https://www.terraform.io/downloads.html) >= 1.2.5


## Install

### Terraform
Be sure you have the correct Terraform version (>= 1.2.5), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## File structure
The project has the following folders and files:

- main.tf: Main file for this module, contains all the resources to create
- provider.tf: File which will store the information about provider
- variables.tf: All the variables for the module
- output.tf: The outputs of the module
- README.md: This file
- locals.tf: All expressions to use in modules
- terraform.tfvars: Variable files
 
## Usage

Create a main.tf file to create a VPC
```
module "vpc_main" {
    source               = "git::https://github.com/tothenew/terraform-aws-vpc.git?ref=v1.0.2"
    cidr_block           = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support   = var.enable_dns_support
    region               = var.region
    profile              = var.profile
    subnet               = var.subnet
    project_name_prefix  = var.project_name_prefix
    common_tags          = var.common_tags
    Project              = var.Project
    Environment          = var.Environment
}
```
Create a terraform.tfvars file for variable passing
```
region               = "ap-south-1"
profile              = ""
cidr_block           = "10.0.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
subnet = {
    "public" = {
        is_public   = true
        nat_gateway = false
        details     = [
            {
                availability_zone = "a"
                cidr_address      = "10.0.0.0/19"
            },
            {
                availability_zone = "b"
                cidr_address      = "10.0.32.0/19"
            }
        ]
    }
    "database" = {
        is_public   = false
        nat_gateway = false
        details     = [
            {
                availability_zone = "a"
                cidr_address      = "10.0.64.0/18"
            },
            {
                availability_zone = "b"
                cidr_address      = "10.0.128.0/18"
            }
        ]
    }
    "application" = {
        is_public   = false
        nat_gateway = true
        details     = [
            {
                availability_zone = "a"
                cidr_address      = "10.0.192.0/19"
            },
            {
                availability_zone = "b"
                cidr_address      = "10.0.224.0/19"
            }
        ]
    }
}
project_name_prefix = "tothenew"
common_tags = {
    "Feature" : "application"
}
Project = "ToTheNew"
Environment = "beta"
```

Create output.tf file for VPC output
```
output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}

output "subnet_details_id" {
  value = module.vpc_main.subnet_details_id
}

output "subnet_details_cidr" {
  value = module.vpc_main.subnet_details_cidr
}

output "internet_gateway_id" {
  value = module.vpc_main.internet_gateway_id
}

output "route_table_id" {
    value = module.vpc_main.route_table_id
}

output "subnet_ids" {
    value = module.vpc_main.route_table_id
}

output "subnet_cidr" {
    value = module.vpc_main.route_table_id
}
```

## Step 1: Perform the following commands in the root folder:

- `terraform init` to get the plugins
- `terraform plan --var-file="terraform.tfvars"` to see the infrastructure plan
- `terraform apply --var-file="terraform.tfvars"` to apply the infrastructure build
- `terraform destroy --var-file="terraform.tfvars"` to destroy the built infrastructure

## Step 2: After performing terraform plan or terraform apply, output will be like below in state file

```
  + internet_gateway_id = (known after apply)
  + route_table_id      = {
      + "application" = (known after apply)
      + "database"    = (known after apply)
      + "public"      = (known after apply)
    }
  + subnet_cidr         = {
      + "application" = (known after apply)
      + "database"    = (known after apply)
      + "public"      = (known after apply)
    }
  + subnet_details_cidr = {
      + "application" = {
          + "application-1" = "10.0.192.0/19"
          + "application-2" = "10.0.224.0/19"
        }
      + "database"    = {
          + "database-1" = "10.0.64.0/18"
          + "database-2" = "10.0.128.0/18"
        }
      + "public"      = {
          + "public-1" = "10.0.0.0/19"
          + "public-2" = "10.0.32.0/19"
        }
    }
  + subnet_details_id   = {
      + "application" = {
          + "application-1" = (known after apply)
          + "application-2" = (known after apply)
        }
      + "database"    = {
          + "database-1" = (known after apply)
          + "database-2" = (known after apply)
        }
      + "public"      = {
          + "public-1" = (known after apply)
          + "public-2" = (known after apply)
        }
    }
  + subnet_ids          = {
      + "application" = (known after apply)
      + "database"    = (known after apply)
      + "public"      = (known after apply)
    }
  + vpc_cidr            = "10.0.0.0/16"
  + vpc_id              = (known after apply)
```

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

| Name                 | Description                                               | Type | Default      | Required |
|----------------------|-----------------------------------------------------------|------|--------------|:--------:|
| cidr_block           | IPV4 range for VPC Creation                               | `string` | 10.20.0.0/20 |   yes    |
| subnet               | Subnet details having zone and cidr address               | `map` | n/a          |   yes    |
| enable_dns_support   | A boolean flag to enable/disable DNS support in the VPC   | `bool` | true         |    no    |
| enable_dns_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | false        |    no    |
| project_name_prefix  | A string value to describe prefix of all the resources    | `string` | tothenew     |    no    |
| common_tags          | A map to add common tags to all the resources             | `map` | n/a          |    no    |
| project              | A string value for tag as Project Name                    | `string` | tothenew     |    no    |
| environment          | A string value for tag as Environment Name                                                          | `string` | dev          |    no    |
| region               | A string value for Launch resources in which AWS Region                                                          | `string` | us-east-1    |    no    |
| profile              | A string value for setting AWS Profile                                                          | `string` | n/a          |    no    |
