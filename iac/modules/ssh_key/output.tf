output "ssh_key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.this.key_name
  
}