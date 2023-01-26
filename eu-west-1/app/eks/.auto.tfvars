role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
region          = "eu-west-1"
environment     = "Development"

# ec2
name            = "gika-eks"
cluster_version = "1.24"
key_name        = "gika-key"
allowed_ip      = [ "0.0.0.0/0" ]