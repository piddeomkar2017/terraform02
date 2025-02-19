resource "aws_instance" "test" {
    ami = "ami-039454f12c36e7620"
    instance_type = "t2.micro"
    tags = {
      Name = "test"
    }
}