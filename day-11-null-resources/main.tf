resource "aws_instance" "test" {
  ami = "ami-0b03299ddb99998e9"
  instance_type = "t2.micro"
  key_name = "aws-ec2"
    tags = {
        Name = "MyWebServer"
    }
}

resource "null_resource" "null-temp" {
    triggers = {
        id = aws_instance.test.id
    }

  provisioner "local-exec" {
    command = "echo 'Hello World 3' > file100"
  }
}