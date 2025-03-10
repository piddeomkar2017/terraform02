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
}