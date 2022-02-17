module "ecr" {
  source       = "./../modules/ecr"
  service_name = var.service_name
}