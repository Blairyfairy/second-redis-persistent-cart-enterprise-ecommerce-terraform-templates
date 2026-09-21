resource "aws_db_subnet_group" "db" {
  name        = "${var.project_name}-db-subnet-group"
  subnet_ids  = [aws_subnet.database_1.id, aws_subnet.database_2.id]
  description = "Database subnet group for Multi-AZ RDS"
}

resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "Database security group for RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "MySQL from Private Subnets"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = [var.private_subnet_cidrs[0], var.private_subnet_cidrs[1]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "${var.project_name}-mysql-db"
  allocated_storage      = 50
  max_allocated_storage  = 200
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot    = true
  storage_encrypted      = true

  tags = {
    Name = "${var.project_name}-mysql-multi-az"
  }
}
