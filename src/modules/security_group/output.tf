output "sg_alb_id" {
  value = aws_security_group.alb.id
}
output "sg_rds_id" {
  value = aws_security_group.rds.id
}