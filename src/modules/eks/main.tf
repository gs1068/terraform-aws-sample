module "main" {
  source  = "terraform-aws-modules/eks/aws"
  version = "14.0.0"

  cluster_name    = "${terraform.workspace}-${var.service_name}"
  cluster_version = var.k8s_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    example = {
      target_group_arns = ["${var.target_group_arns}"]
      subnets         = var.subnet_ids
    }
  }

  write_kubeconfig   = true
  config_output_path = pathexpand("~/.kube/config")
}