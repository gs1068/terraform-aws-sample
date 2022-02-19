module "lb" {
  source             = "./../modules/alb"
  vpc_id             = module.vpc.vpc_id
  service_name       = var.service_name
  public_subnet_a_id = module.vpc.public_subnet_a_id
  public_subnet_c_id = module.vpc.public_subnet_c_id
  public_subnet_d_id = module.vpc.public_subnet_d_id
  sg_alb_id          = module.security_group.sg_alb_id
}