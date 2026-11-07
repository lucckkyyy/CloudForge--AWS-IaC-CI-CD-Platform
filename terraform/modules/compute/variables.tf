variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR, used to limit the load balancer's outbound traffic"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
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

variable "enable_https" {
  description = "Add an HTTPS listener and redirect HTTP to it"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ACM certificate ARN, used only when enable_https is true"
  type        = string
  default     = ""
}
