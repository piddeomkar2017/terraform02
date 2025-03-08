resource "aws_instance" "my-ec2" {
    tags = {
      Name = "prod-server"
    }
    ami = "ami-0b5a4445ada4a59b1"
    instance_type = "t2.micro"
}