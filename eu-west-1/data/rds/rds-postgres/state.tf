terraform {
  backend "s3" {
    bucket          = "gika-tf-state"
    region          = "eu-west-1"
    encrypt         = true
    dynamodb_table  = "gika-tf-state-lock"
    role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
    key             = "eu-west-1/data/rds/rds-postgres"
  }
}


data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket          = "gika-tf-state"
        region          = "eu-west-1"
        encrypt         = true
        role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
        key             = "eu-west-1/network/vpc/gika-vpc"
    }
}

data "terraform_remote_state" "parameter_group" {
    backend = "s3"
    config = {
        bucket          = "gika-tf-state"
        region          = "eu-west-1"
        encrypt         = true
        role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
        key             = "eu-west-1/data/rds/gika-postgres-parameter-group"
    }
}

data "terraform_remote_state" "subnet_group" {
    backend = "s3"
    config = {
        bucket          = "gika-tf-state"
        region          = "eu-west-1"
        encrypt         = true
        role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
        key             = "eu-west-1/data/rds/subnet-group"
    }
}

data "terraform_remote_state" "zones" {
    backend = "s3"
    config = {
        bucket          = "gika-tf-state"
        region          = "eu-west-1"
        encrypt         = true
        role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
        key             = "eu-west-1/network/route53/zones"
    }
}