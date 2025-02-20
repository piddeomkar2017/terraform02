module "ec2_module" {
    source = "../day-2-basic-module"
    ami_id = "ami-039454f12c36e7620"
    instance_type = "t2.micro"
}