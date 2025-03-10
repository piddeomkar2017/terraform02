locals {
    project_name = "my-app"
    environment = "dev"
    tags = {
        Name = "${local.project_name}-${local.environment}"
        ManagedBy = "Terraform"
    }
}

resource "aws_instance" "test-server" {
    ami = "ami-0b5a4445ada4a59b1"
    instance_type = "t2.micro"
    tags = local.tags

    provisioner "file" {
        source = "abc.txt"
        destination = "/home/ec2-user/omkar/abc.txt"
    }
    provisioner "remote-exec" {
        inline = [
            "echo 'Hello from Terraform' > /home/ec2-user/sample.txt",
            "cd /home/ec2-user",
            "touch a b c d e f"
        ]
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("aws-tokyo-key-pair.pem")
      host = self.public_ip
    }
    key_name = "aws-ec2"

}

output "public-ip" {
  value = aws_instance.test-server.public_ip
}