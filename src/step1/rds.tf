# module "rds" {
#   source              = "./../modules/rds"
#   service_name        = var.service_name
#   database_name       = "testdatabase"
#   master_username     = "testusername"
#   master_password     = "testpassword"
#   sg_rds_id           = module.security_group.sg_rds_id
#   private_subnet_a_id = module.vpc.private_subnet_a_id
#   private_subnet_c_id = module.vpc.private_subnet_c_id
#   private_subnet_d_id = module.vpc.private_subnet_d_id
# }