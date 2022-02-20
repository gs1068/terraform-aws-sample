module "eks" {
  source       = "./../modules/eks"
  service_name = var.service_name
  version = "14.0.0"

  worker_groups = [{
    root_volume_type = "gp2"
    target_group_arns = [aws_alb_target_group.tg.arn]
  }]
}