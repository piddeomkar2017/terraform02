resource "aws_instance" "test" {
  ami = "ami-0b03299ddb99998e9"
  instance_type = "t2.micro"
  key_name = "aws-ec2"

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("~/Downloads/aws-ec2.pem")
  }

  provisioner "local-exec" {
    command = "touch file500"
  }
  provisioner "remote-exec" {
    inline = [ 
        "touch file100",
        "echo 'Hello World' > file100",
     ]
  }

}