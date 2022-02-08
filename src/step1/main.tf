terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
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