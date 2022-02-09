variable "region" { default = "ap-northeast-1" }

terraform {
  backend "s3" {
    bucket = "terraform-sample-step1"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
# AWSプロバイダーの設定
provider "aws" {
  region = var.region
}