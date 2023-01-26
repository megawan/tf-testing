resource "aws_db_parameter_group" "default" {
  name   = "gika-postgres-parameter-group"
  family = "postgres14"

  parameter {
    name = "cron.max_running_jobs"
    value = 5
  }

  tags = {
    Name        = "postgres-paremeter-group"
    Environment = var.environment
    Terraform   = true
  }
}