output "certificate_arn" {
  description = "Validated certificate ARN, or empty when DNS is disabled"
  value       = var.enable ? aws_acm_certificate_validation.this[0].certificate_arn : ""
}
