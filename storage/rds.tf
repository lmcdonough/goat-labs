# Define the RDS PostgreSQL instance
resource "aws_db_instance" "my_rds_instance" {
  identifier             = "my-rds-instance"
  engine                 = "postgres"
  engine_version         = "12.7"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name
  parameter_group_name   = aws_db_parameter_group.my_db_parameter_group.name
}

# Define the RDS subnet group
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.my_subnet.id]
}

# Define the RDS parameter group
resource "aws_db_parameter_group" "my_db_parameter_group" {
  name        = "my-db-parameter-group"
  family      = "postgres12"
  description = "My RDS parameter group"
  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
  }
}

# Define the RDS security group rule
resource "aws_security_group_rule" "my_rds_security_group_rule" {
  security_group_id = aws_security_group.my_security_group.id
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
}
