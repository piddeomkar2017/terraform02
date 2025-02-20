resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.test.name
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "test" {
  name       = "custome-subnet-group"
  subnet_ids = ["subnet-0c6bffa13955f536d","subnet-0d5d16e81c4d817b2"]
  description = "custome-subnet-group"
}