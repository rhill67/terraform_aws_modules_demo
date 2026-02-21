data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "aws_security_group" "rds" {
  name        = "${var.name_prefix}-rds-sg"
  description = "RDS security group (demo - allow within VPC CIDR)"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.this.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name_prefix}-rds-sg" }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-dbsubnet"
  subnet_ids = var.subnet_ids
  tags       = { Name = "${var.name_prefix}-dbsubnet" }
}

resource "aws_db_instance" "this" {
  identifier        = "${var.name_prefix}-rds"
  allocated_storage = 20
  storage_type      = "gp3"
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.instance_class

  db_name  = var.db_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 0

  tags = { Name = "${var.name_prefix}-rds" }
}
