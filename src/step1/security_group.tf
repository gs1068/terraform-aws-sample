module "security_group" {
  source       = "./../modules/security_group"
  vpc_id       = module.vpc.vpc_id
  service_name = var.service_name
}