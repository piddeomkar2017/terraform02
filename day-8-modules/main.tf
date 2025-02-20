module "ec2_module" {
    source = "../day-2-basic-module"
    ami_id = var.ami_id-1
    instance_type = var.instance_type-1
}