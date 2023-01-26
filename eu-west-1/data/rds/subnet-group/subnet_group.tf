resource "aws_db_subnet_group" "default" {
  name       = "gika-db-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.database_subnets

  tags = {
    Name        = "gika-db-subnet-group"
    Environment = var.environment
    Terraform   = true
  }
}

