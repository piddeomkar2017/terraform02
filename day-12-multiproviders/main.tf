resource "aws_s3_bucket" "test-1" {
  bucket = "test-1-25022025"
}
resource "aws_s3_bucket" "test-2" {
  bucket = "test-2abc-25022025"
  provider = aws.provider-1
}