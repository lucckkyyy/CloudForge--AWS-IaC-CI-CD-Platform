variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  description = "Prefix used for resource names"
  type        = string
  default     = "cloudforge"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "Two Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "enable_dns" {
  description = "Create the ACM certificate and Route 53 record. Needs a domain you own."
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Full record name, for example app.example.com"
  type        = string
  default     = ""
}

variable "hosted_zone_id" {
  description = "Route 53 hosted zone ID for the domain"
  type        = string
  default     = ""
}
