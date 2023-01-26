output "alb_id" {
    description = "ALB ID"
    value       = module.alb.lb_id
}

output "arn" {
  description = "The ARN of Loadbalancer"
  value       = module.alb.lb_arn
}

output "https_listener_arn" {
  description = "HTTPS Listener ARN"
  value       = module.alb.https_listener_arns
}

output "http_tcp_listener_arn" {
  description = "HTTP/TCP Listener ARN"
  value       = module.alb.http_tcp_listener_arns
}

output "dns_name" {
  description = "DNS Name"
  value       = module.alb.lb_dns_name
}

output "tg_arn" {
    description = "Target Group ARN"
    value       = module.alb.target_group_arns
}

