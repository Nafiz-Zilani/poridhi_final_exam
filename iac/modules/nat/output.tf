output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_name" {
  description = "The name of the NAT Gateway"
  value       = aws_nat_gateway.this.tags["Name"]
}