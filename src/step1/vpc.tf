module "vpc" {
  source         = "./../modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  region         = var.region
  service_name   = var.service_name
}