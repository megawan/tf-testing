output "arn" {
  description = "The arn of parameter group"
  value       = aws_db_parameter_group.default.arn
}

output "id" {
  description = "The id of parameter group"
  value       = aws_db_parameter_group.default.id
}

output "name" {
  description = "The name of parameter group"
  value       = aws_db_parameter_group.default.name
}

output "family" {
  description = "The family of parameter group"
  value       = aws_db_parameter_group.default.family
}