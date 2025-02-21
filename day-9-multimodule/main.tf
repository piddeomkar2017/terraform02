module "ec2" {
  source = "./modules/ec2"
  instance_type = var.type
  ami_id = var.am_id
}

module "s3" {
  source = "./modules/s3"
}