module "vpc" {
  source         = "./../modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "terraform-sample-${terraform.workspace}"
  ENV            = terraform.workspace
  region         = var.region
}