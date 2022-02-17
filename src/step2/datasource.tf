variable "s3_key" {}

data "terraform_remote_state" "step1" {
  backend = "s3"

  config = {
    bucket = "${var.service_name}-step1"
    key    = var.s3_key
    region = "ap-northeast-1"
  }
}