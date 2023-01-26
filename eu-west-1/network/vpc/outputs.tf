output "vpc_id" {
    description = "VPC Id"
    value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
    description = "VPC CIDR Block"
    value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
    description = "Public Subnets ID's"
    value       = module.vpc.public_subnets
}

output "private_subnets" {
    description = "Private Subnets ID's"
    value       = module.vpc.private_subnets
}

output "database_subnets" {
    description = "Data Subnets ID's"
    value       = module.vpc.database_subnets
}

output "public_route_table_ids" {
    description = "Public Route Tables ids"
    value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
    description = "Private Route Tables ids"
    value       = module.vpc.private_route_table_ids
}

output "database_route_table_ids" {
    description = "Private Route Tables ids"
    value       = module.vpc.database_route_table_ids
}