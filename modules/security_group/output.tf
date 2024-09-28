output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.allow_port.id
}

output "security_group_name" {
  description = "Nome do Security Group"
  value       = aws_security_group.allow_port.name
}

output "security_group_vpc_id" {
  description = "ID da VPC associada ao Security Group (VPC padrão)"
  value       = aws_security_group.allow_port.vpc_id
}

output "security_group_arn" {
  description = "ARN do Security Group"
  value       = aws_security_group.allow_port.arn
}