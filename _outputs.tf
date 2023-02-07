output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = var.cidr_block
}
