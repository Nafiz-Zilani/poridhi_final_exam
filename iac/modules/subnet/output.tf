output "subnets_ids" {
  value = { for k, s in aws_subnet.this : k => s.id }
}

output "subnets_names" {
  value = { for k, s in aws_subnet.this : k => s.name}
}