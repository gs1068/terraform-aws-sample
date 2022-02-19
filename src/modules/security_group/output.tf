output "sg_alb_id" {
  value = aws_security_group.alb.id
}
output "sg_rds_id" {
  value = aws_security_group.rds.id
}
output "sg_eks_master_id" {
  value = aws_security_group.eks-master.id
}
output "sg_eks_node_id" {
  value = aws_security_group.eks-node.id
}