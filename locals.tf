locals {
    project_name_prefix = "testing"

    common_tags = {
        Project     = "Terraform"
        Environment = "dev"
    }

    public_subnet_name =  [for subnet_name, subnet_detail1 in var.subnet : subnet_name if subnet_detail1.is_public == true][0]

}
