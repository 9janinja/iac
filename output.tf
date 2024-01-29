# Terraform Output Values
output "ansible_publicIp" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.ubuntu.public_ip
}

# EC2 Instance Public IP
output "instance_publicIp" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.hosts[*].public_ip
}

# EC2 Instance Public DNS
output "instance_privateIp" {
  description = "EC2 Instance Private IP"
  value       = aws_instance.hosts[*].private_ip
}
