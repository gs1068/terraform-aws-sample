module "rds" {
  source              = "./../modules/rds"
  service_name        = var.service_name
  database_name       = "testdatabase"
  master_username     = "testusername"
  master_password     = "testpassword"
  sg_rds_id           = data.terraform_remote_state.step1.outputs.sg_rds_id
  private_subnet_a_id = data.terraform_remote_state.step1.outputs.private_subnet_a_id
  private_subnet_c_id = data.terraform_remote_state.step1.outputs.private_subnet_c_id
  private_subnet_d_id = data.terraform_remote_state.step1.outputs.private_subnet_d_id
}