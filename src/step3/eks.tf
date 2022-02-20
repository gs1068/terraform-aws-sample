module "eks" {
  source       = "./../modules/eks"
  k8s_version  = "1.21"
  service_name = var.service_name
  subnet_ids = [
    data.terraform_remote_state.step1.outputs.public_subnet_a_id,
    data.terraform_remote_state.step1.outputs.public_subnet_c_id,
    data.terraform_remote_state.step1.outputs.public_subnet_d_id
  ]
  vpc_id            = data.terraform_remote_state.step1.outputs.vpc
  target_group_arns = data.terraform_remote_state.step1.outputs.eks_alb_tg
}