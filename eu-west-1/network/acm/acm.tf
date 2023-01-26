module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.1"

  domain_name = "*.${data.terraform_remote_state.public_domain.outputs.zone_name["${var.domain}"]}"
  zone_id     = data.terraform_remote_state.public_domain.outputs.zone_id["${var.domain}"]

  subject_alternative_names = [
    data.terraform_remote_state.public_domain.outputs.zone_name["${var.domain}"]
  ]

  wait_for_validation = true

  tags = {
    Name = var.domain
    Environment = var.environment
    Terraform = true
  }
}