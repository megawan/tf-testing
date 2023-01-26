module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  
  zone_name = keys(data.terraform_remote_state.zones.outputs.zone_id)[0]
  records   = [
    {
      name           = "db"
      type           = "CNAME"
      ttl            = 300
      records        = [module.db.db_instance_address]
    },                        
  ]
}