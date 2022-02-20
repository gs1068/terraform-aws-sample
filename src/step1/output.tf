output "vpc" {
  value = module.vpc.vpc_id
}

output "sg_rds_id" {
  value = module.security_group.sg_rds_id
}

output "sg_eks_master_id" {
  value = module.security_group.sg_eks_master_id
}

output "sg_eks_node_id" {
  value = module.security_group.sg_eks_node_id
}

output "public_subnet_a_id" {
  value = module.vpc.public_subnet_a_id
}

output "public_subnet_c_id" {
  value = module.vpc.public_subnet_c_id
}

output "public_subnet_d_id" {
  value = module.vpc.public_subnet_d_id
}

output "private_subnet_a_id" {
  value = module.vpc.private_subnet_a_id
}

output "private_subnet_c_id" {
  value = module.vpc.private_subnet_c_id
}

output "private_subnet_d_id" {
  value = module.vpc.private_subnet_d_id
}

output "eks_master_iam_role" {
  value = module.iam_role.iam_role_eks_master
}

output "eks_node_iam_role" {
  value = module.iam_role.iam_role_eks_node
}

output "eks_alb_tg" {
  value = module.alb.eks_target_group_arn
}