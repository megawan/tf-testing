# global
role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
region          = "eu-west-1"
environment     = "Development"

# RDS
instance_type   = "db.t3.small"
db_name         = "postgres"
username        = "postgres"
port            = 5432
allowed_ip      = [ "10.100.0.0/16" ]

## Domain
domain          = "gika.dev"