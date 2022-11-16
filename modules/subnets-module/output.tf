output "subnet_id" {
  value = tomap({ for k, bd in module.subnet_main : "${var.name}-${k + 1}" => bd.subnet_id })
}

output "subnet_cidr" {
  value = tomap({ for k, bd in module.subnet_main : "${var.name}-${k + 1}" => bd.subnet_cidr })
}
