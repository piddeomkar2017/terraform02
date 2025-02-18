terraform {
  backend "s3" {
    bucket = "my-bucket-18022025"
    key = "day-4/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamodb"
    encrypt = true
    region = "ap-southeast-1"
  }
}