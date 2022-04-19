module "vpc_main" {
    source               = "../../modules/vpc"
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = false
    enable_dns_support = true
    tags                 = {
        "Name"          : "Simple-VPC"
        "Project"       : "Terraform"
        "Environment"   : "dev"
    }
}