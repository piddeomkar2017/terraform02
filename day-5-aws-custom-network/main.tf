resource "aws_vpc" "prod" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = var.vpc_name
    }
}
resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "${var.vpc_name}-igw"
    }  
}

resource "aws_subnet" "prod" {
   vpc_id = aws_vpc.prod.id  
   tags = {
     Name = "${var.vpc_name}-subnet-1"
   }
   cidr_block = "10.0.0.0/24"
}

resource "aws_route_table" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "${var.vpc_name}-rt"
    }
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prod.id
      }
}
resource "aws_route_table_association" "prod" {
    route_table_id = aws_route_table.prod.id
    subnet_id = aws_subnet.prod.id
}