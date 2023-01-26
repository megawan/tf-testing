terraform {
  backend "s3" {
    bucket          = "gika-tf-state"
    region          = "eu-west-1"
    encrypt         = true
    dynamodb_table  = "gika-tf-state-lock"
    role_arn        = "arn:aws:iam::995105043624:role/gika-admin-role"
    key             = "eu-west-1/data/s3/gika-tf-state"
  }
}

# terraform {
#   backend "local" {
#     path = "./terraform.tfstate"
#     }
# }