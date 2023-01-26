module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.2.3"

  identifier            = "gika-db-postgres"
  engine                = "postgres"
  engine_version        = "14"
  instance_class        = var.instance_type
  allocated_storage     = 50
  max_allocated_storage = 100
  storage_encrypted     = false

  db_name               = var.db_name     
  username              = var.username
  password              = var.password
  port                  = var.port
  
  ### db configuration
  family                        = data.terraform_remote_state.parameter_group.outputs.family
  db_subnet_group_name          = data.terraform_remote_state.subnet_group.outputs.name
  performance_insights_enabled  = false
  vpc_security_group_ids        = [aws_security_group.sg.id]
  backup_window                 = "23:00-00:00"
  maintenance_window            = "Mon:00:00-Mon:02:00"
  backup_retention_period       = 0
  skip_final_snapshot           = false 
  deletion_protection           = false
  multi_az                      = true
  #enabled_cloudwatch_logs_exports = ["audit", "general"]
  #final_snapshot_identifier = "demodb"
  tags = {
    Terraform       = true
    Environment     = var.environment
  }



}