variable "region" { default = "ap-northeast-1" }
variable "service_name" {}

terraform {
  backend "s3" {
    bucket = "terraform-sample-step2"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
# AWSプロバイダーの設定
provider "aws" {
  region = var.region
}