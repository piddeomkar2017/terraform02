module "db" {
  source = "terraform-aws-modules/rds/aws"
  identifier = "mydb-omkar"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  allocated_storage = 5

  db_name = "demodb-omkar"

  username = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["password"]


  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  vpc_security_group_ids = ["sg-0abdc8cba214ebab0"]


}


resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

data "aws_secretsmanager_secret" "rds_credentials" {
  name = "example"
}

data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = data.aws_secretsmanager_secret.rds_credentials.id
}