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
 
## Usage

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

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->
