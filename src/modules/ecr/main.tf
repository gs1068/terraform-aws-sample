resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${var.service_name}-${terraform.workspace}"
  image_tag_mutability = "MUTABLE"
  // コンテナイメージのセキュリティ診断
  image_scanning_configuration {
    scan_on_push = true
  }
}