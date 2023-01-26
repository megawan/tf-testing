role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
region          = "eu-west-1"

# vpc
name            = "gika-vpc"
environment     = "Development"
cidr            = "10.100.0.0/16"
azs             = [ "eu-west-1a", "eu-west-1b", "eu-west-1c" ]

# subnets
public_subnets  = [ "10.100.0.0/22", "10.100.4.0/22", "10.100.8.0/22" ]
private_subnets = [ "10.100.16.0/20", "10.100.32.0/20", "10.100.48.0/20" ]
data_subnets    = [ "10.100.64.0/20", "10.100.80.0/20", "10.100.96.0/20" ]
