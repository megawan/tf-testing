module "zones" {
  source = "terraform-aws-modules/route53/aws//modules/zones"

  zones = {
    "gika.dev" = {
      comment = "Terraform Managed"
      tags = {
        Name        = var.domain
        Environment = var.environment
      }
    }
  }

  tags = {
    Terraform = true
    Domain    = "Public"
  }
}