# Global Variable
variable "role_arn" {}
variable "environment" {}
variable "region" {}

# ec2 
variable "name" {}
variable "cluster_version" {}
variable "key_name" {}
variable "allowed_ip" {}
variable "tags" {
  default = {}
}
