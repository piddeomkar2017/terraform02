terraform {
  backend "s3" {
    bucket = "my-bucket-09012025"
    key = "day-3/terraform.tfstate"
    region = "us-east-2"
  }
}