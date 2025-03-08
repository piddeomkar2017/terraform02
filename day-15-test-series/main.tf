resource "aws_instance" "my-ec2" {
    tags = {
      Name = var.name
    }
    ami = var.ec2_ami
    instance_type = var.type
}