module "ec2-server-1" {
  source = "./modules/ec2"
  ami-id-1 = "ami-0b5a4445ada4a59b1"
  type-1 = "t2.micro"
  name-1 = "prod-server"
}
