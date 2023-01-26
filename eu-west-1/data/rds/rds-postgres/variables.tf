# Global
variable "role_arn" {}
variable "environment" {}
variable "region" {}
variable "domain" {}

# RDS
variable "instance_type" {}
variable "allowed_ip" {
  default = []
}
variable "username" {}
variable "db_name" {}
variable "port" {}
variable "password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}