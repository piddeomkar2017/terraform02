terraform {
  backend "s3" {
    bucket = "test-08032025"
    key    = "test-series/terraform.tfstate"
    region = "ap-northeast-1"
  }
}