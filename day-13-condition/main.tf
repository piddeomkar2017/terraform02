#not working yet
variable "condition" {
  default = false
  
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-test-bucket"
  count = var.condition ? 1 : 0
}