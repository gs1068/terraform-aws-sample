resource "aws_security_group" "alb" {
  name        = "alb-${var.service_name}-${terraform.workspace}"
  vpc_id      = "${var.vpc_id}"

  # セキュリティグループ内のリソースからインターネットへのアクセスを許可する
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-${var.service_name}-${terraform.workspace}"
  }
}

resource "aws_security_group_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id
  # セキュリティグループ内のリソースへインターネットからのアクセスを許可する
  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# ------------rds------------

resource "aws_security_group" "rds" {
  name        = "rds-${var.service_name}-${terraform.workspace}"
  description = "${terraform.workspace}"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-${var.service_name}-${terraform.workspace}"
  }
}

# ------------eks------------
resource "aws_security_group" "eks-master" {
  name        = "eks-master-${var.service_name}-${terraform.workspace}"
  vpc_id      = "${var.vpc_id}"
  description = "EKS master security group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-master-${var.service_name}-${terraform.workspace}"
  }
}

resource "aws_security_group" "eks-node" {
  name        = "eks-node-${var.service_name}-${terraform.workspace}"
  vpc_id      = "${var.vpc_id}"
  description = "EKS node security group"

  ingress {
    description     = "Allow cluster master to access cluster node"
    from_port       = 1025
    to_port         = 65535
    protocol        = "tcp"
    security_groups = ["${aws_security_group.eks-master.id}"]
  }

  ingress {
    description     = "Allow cluster master to access cluster node"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.eks-master.id}"]
    self            = false
  }

  ingress {
    description = "Allow inter pods communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-node-${var.service_name}-${terraform.workspace}"
  }
}