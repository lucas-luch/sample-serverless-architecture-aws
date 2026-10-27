output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block da VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  description = "Mapa com nome da subnet → ID"
  value       = { for k, v in aws_subnet.this : k => v.id }
}

output "app_subnet_ids" {
  description = "IDs das subnets de aplicação"
  value       = [for k, v in aws_subnet.this : v.id if startswith(k, "app-")]
}

output "database_subnet_ids" {
  description = "IDs das subnets de banco de dados"
  value       = [for k, v in aws_subnet.this : v.id if startswith(k, "database-")]
}

output "app_route_table_id" {
  description = "ID da route table principal"
  value       = aws_route_table.app.id
}

output "dynamodb_endpoint_id" {
  description = "ID do VPC Endpoint do DynamoDB"
  value       = aws_vpc_endpoint.dynamodb.id
}

output "default_security_group_id" {
  description = "ID do security group default da VPC"
  value       = aws_default_security_group.default.id
}
