locals {
    public_subnet_name =  [for subnet_name, subnet_detail1 in var.subnet : subnet_name if subnet_detail1.is_public == true][0]

    project_name_prefix = var.project_name_prefix
}
