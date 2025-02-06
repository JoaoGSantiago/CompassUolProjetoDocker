resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  db_name                = "wordpressdb"
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot    = true

  tags = {
    Name       = "PB - NOV 2024"
    CostCenter = "C092000024"
    Project    = "PB - NOV 2024"
  }

}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.privada-app-A.id, aws_subnet.privada-app-B.id]
  tags = {
    Name = "rds_subnet_group"
  }
}