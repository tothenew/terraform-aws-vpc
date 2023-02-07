locals {
  subnet_group_keys = keys(var.subnet_group)
  subnet_group_bits = {
    for group in local.subnet_group_keys : group => [
      for az in range(var.max_subnet_az) : var.subnet_bits
    ]
  }
  subnet_cidr_blocks       = cidrsubnets(var.cidr_block, flatten(values(local.subnet_group_bits))...)
  subnet_cidr_blocks_chunk = chunklist(local.subnet_cidr_blocks, var.max_subnet_az)
  subnet_group_cidr_blocks = {
    for idx, group in local.subnet_group_keys : group => local.subnet_cidr_blocks_chunk[idx]
  }
  public_subnet_name = [for subnet_name, subnet_detail in var.subnet_group : subnet_name if subnet_detail.is_public == true][0]
}
