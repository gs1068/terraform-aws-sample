output "iam_role_eks_master" {
  value = aws_iam_role.eks-master.arn
}

output "iam_role_eks_node" {
  value = aws_iam_role.eks-node.arn
}