# Create a RDS Database Instance
resource "aws_db_instance" "myrdsinstance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 5
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  multi_az               = true
}

resource "aws_db_subnet_group" "rds_subnets" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnets["private_subnet_1"].id, aws_subnet.private_subnets["private_subnet_2"].id]
}


# To Create a security group for RDS Database Instance
resource "aws_security_group" "rds_sg" {
  name   = "rds_sg"
  vpc_id = aws_vpc.rds_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_instance.my_instance.private_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
