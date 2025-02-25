variable "ingress-ports" {
  default = [
    {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
        {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    },
        {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["178.168.0.0/16"]
    }
  ]
}