module "main" {
  source  = "terraform-aws-modules/eks/aws"
  version = "14.0.0"

  cluster_name    = "${terraform.workspace}-${var.service_name}"
  cluster_version = var.k8s_version
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  worker_groups = [{
  # worker_groups_launch_template = [{
    root_volume_type = "gp2"
    target_group_arns = ["${var.target_group_arns}"]
  }]

  write_kubeconfig   = true
  config_output_path = pathexpand("~/.kube/config")
}