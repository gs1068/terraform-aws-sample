resource "aws_db_subnet_group" "this" {
    name        = "${var.service_name}-${terraform.workspace}-sng"
    subnet_ids  = [
      "${var.private_subnet_a_id}",
      "${var.private_subnet_c_id}",
      "${var.private_subnet_d_id}"
      ]
    tags = {
        Name = "${var.service_name}-${terraform.workspace}-sng"
    }
}

resource "aws_rds_cluster" "this" {
  cluster_identifier      = "${var.service_name}-${terraform.workspace}"
  db_subnet_group_name    = "${aws_db_subnet_group.this.name}"
  vpc_security_group_ids  = ["${var.sg_rds_id}"]
  engine                  = "aurora-mysql"
  port                    = "3306"
  database_name           = "${var.database_name}"
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "this" {
  identifier           = "${terraform.workspace}-instance"
  cluster_identifier   = "${aws_rds_cluster.this.id}"
  engine               = "aurora-mysql"
  instance_class       = "db.t3.small"
}
