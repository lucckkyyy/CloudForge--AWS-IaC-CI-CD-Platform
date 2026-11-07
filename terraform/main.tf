module "network" {
  source   = "./modules/network"
  name     = var.name
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

module "compute" {
  source             = "./modules/compute"
  name               = var.name
  vpc_id             = module.network.vpc_id
  vpc_cidr           = var.vpc_cidr
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  instance_type      = var.instance_type
  min_size           = var.min_size
  max_size           = var.max_size
  enable_https       = var.enable_dns
  certificate_arn    = module.dns.certificate_arn
}

module "dns" {
  source         = "./modules/dns"
  enable         = var.enable_dns
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  alb_dns_name   = module.compute.alb_dns_name
  alb_zone_id    = module.compute.alb_zone_id
}
