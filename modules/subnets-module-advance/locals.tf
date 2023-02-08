locals {
  public_subnet_name = [for subnet_name, subnet_detail in var.subnet : subnet_name if subnet_detail.is_public == true][0]
}
