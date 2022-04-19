output "vpc_id" {
  value = module.vpc_main.vpc_id
}

output "vpc_cidr" {
  value = "10.0.0.0/16"
}
