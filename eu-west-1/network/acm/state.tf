terraform {
  backend "s3" {
    bucket          = "gika-tf-state"
    region          = "eu-west-1"
    encrypt         = true
    dynamodb_table  = "gika-tf-state-lock"
    role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
    key             = "eu-west-1/network/acm"
  }
}

data "terraform_remote_state" "public_domain" {
    backend = "s3"
    config = {
        bucket          = "gika-tf-state"
        region          = "eu-west-1"
        encrypt         = true
        role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
        key             = "eu-west-1/network/route53/zones"
    }
}