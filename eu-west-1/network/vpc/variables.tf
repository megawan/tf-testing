# Global Variables
variable "role_arn" {}
variable "environment" {}
variable "tags" {default = {}}

# vpc variables
variable "name" {}
variable "cidr" {}
variable "region" {}
variable "azs" {default = []}

# subnet variables
variable "public_subnets" {default = []}
variable "private_subnets" {default = []}
variable "data_subnets" {default = []}