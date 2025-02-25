provider "aws" {
  region = "ap-southeast-1"
  
}
provider "aws" {
  alias = "provider-1"
  region = "us-east-1"
}