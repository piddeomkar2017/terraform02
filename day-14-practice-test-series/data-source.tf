
# # Here, the data source (aws_ami) fetches the latest Amazon Linux AMI from AWS.
# data "aws_ami" "latest-amazon-ami" {
#   most_recent = true
#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
#   owners = ["amazon"]
# }

# output "ami-name" {
#   value = data.aws_ami.latest-amazon-ami.name
# }

##############################################
# # Create a data source to fetch the default VPC ID
# # Create a security group in the default VPC 

# data "aws_vpc" "vpc-id" {
#   default = true
# }

# output "default-vpc-id" {
#    value = data.aws_vpc.vpc-id.id 
# }

# resource "aws_security_group" "sg-1" {
#    tags = {
#      "Name" = "sg-1"
#    }
#    vpc_id = data.aws_vpc.vpc-id.id
#    ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }


##############################################
# # Create a data source to fetch the default VPC ID
# # Create a security group in the default VPC

# data "aws_vpc" "vpc-id" {
#   default = true
# }
# resource "aws_security_group" "test-sg" {
#     name = "test-sg"
#     tags = {
#         Name = "test-sg"
#     }
#     vpc_id = data.aws_vpc.vpc-id.id
#     dynamic "ingress" {
#       for_each = [22,443,80,3000]
#       content {
#         from_port = ingress.value
#         to_port = ingress.value
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#       }
#     }

#     egress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

# }