resource "aws_alb" "alb_eks" {
  name                       = "alb-eks-${terraform.workspace}"
  security_groups            = [
    "${var.sg_alb_id}"
  ]
  subnets = [
    "${var.public_subnet_a_id}",
    "${var.public_subnet_c_id}",
    "${var.public_subnet_d_id}",
  ]
  internal                   = false
  enable_deletion_protection = false
}

// EKS用ターゲットグループの作成
resource "aws_alb_target_group" "alb_eks" {
  name     = "${terraform.workspace}-tg-http"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  target_type = "ip"

  health_check {
    interval            = 60
    path                = "/"
    port                = 8080  
    protocol            = "HTTP"
    timeout             = 20
    unhealthy_threshold = 4
    matcher             = 200
  }
}

resource "aws_alb_listener" "alb_http" {
  load_balancer_arn = aws_alb.alb_eks.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.alb_eks.arn
    type             = "forward"
  }
}