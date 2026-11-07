output "alb_dns_name" {
  description = "Open this in a browser after apply"
  value       = module.compute.alb_dns_name
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "app_url" {
  value = var.enable_dns ? "https://${var.domain_name}" : "http://${module.compute.alb_dns_name}"
}
