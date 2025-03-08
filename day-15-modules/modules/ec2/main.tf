resource "aws_instance" "ec2-server" {
    ami = var.ami-id-1
    instance_type = var.type-1
    tags = {
        Name = var.name-1
    }
}