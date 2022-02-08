terraform {
  backend "s3" {
    bucket = "terraform-sample-step1"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
# AWSプロバイダーの設定
provider "aws" {
  region = "ap-northeast-1"
}

# CIDRが10.0.0.0/16のVPCを作成
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}