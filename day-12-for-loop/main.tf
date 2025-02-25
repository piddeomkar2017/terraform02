resource "aws_security_group" "test-sg" {
  name = "test-sg"
  tags = {
    Name = "test-sg"
  }
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

resource "aws_security_group" "dev-sg" {
  name = "dev-sg"
  tags = {
    Name = "dev-sg"
  }
  dynamic "ingress" {
    for_each = [22,443,80,3000]
    content {
      from_port = ingress.value
      to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "prod-sg" {
    name = "prod-sg"
    tags = {
        Name = "prod-sg"
    }
    dynamic "ingress" {
        for_each = var.ingress-ports
        content {
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
    }
  
}