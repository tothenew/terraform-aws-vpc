output "subnet_id" {
  value = aws_subnet.subnet_main.id
}

output "subnet_cidr" {
  value = aws_subnet.subnet_main.cidr_block
}
