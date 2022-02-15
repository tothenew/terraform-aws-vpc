module "subnet_main" {
    count                   = length(var.subnet_details)
    source                  = "../subnets"
    vpc_id                  = var.vpc_id
    cidr_block              = lookup(var.subnet_details[count.index], "cidr_address", "undefined")
    availability_zone       = "${var.region}${lookup(var.subnet_details[count.index], "availability_zone", "undefined")}"
    map_public_ip_on_launch = var.is_public
    tags                    = merge(var.common_tags, tomap({
        "Name" : "${var.project_name_prefix}-${var.name}-${count.index + 1}"
    }))
}
