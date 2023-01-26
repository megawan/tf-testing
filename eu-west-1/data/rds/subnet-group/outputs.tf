output "arn" {
  description = "The arn of subnet group"
  value       = aws_db_subnet_group.default.arn
}

output "id" {
  description = "The id of subnet group"
  value       = aws_db_subnet_group.default.id
}

output "name" {
  description = "The name of subnet group"
  value       = aws_db_subnet_group.default.name
}