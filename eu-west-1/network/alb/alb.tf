module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.2.1"

  name = "gika-alb-public"

  load_balancer_type = "application"

  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups = [aws_security_group.sg.id]
  internal        = false

  #   access_logs = {
  #     bucket = module.log_bucket.this_s3_bucket_id
  #   }

  target_groups = [
    {
      name             = "gika-stg-public"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      healthcheck      = "/"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.acm.outputs.acm_certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = {
    Environment = var.environment
    Terraform = true
  }
}
