variable "region" { default = "ap-northeast-1" }
variable "service_name" {}

terraform {
  # required_version = "= 0.14.7"

  backend "s3" {
    bucket = "terraform-aws-sample-step3"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
# AWSプロバイダーの設定
provider "aws" {
  region = var.region
}