# resource "aws_s3_bucket" "bucket-1" {
#   bucket = "test-bucket-08032025-1"
# }

# resource "aws_s3_bucket" "bucket-3" {
#   bucket = "test-bucket-08032025-3"
# }

# resource "aws_s3_bucket" "bucket-2" {
#   bucket = "test-bucket-08032025-2"
#   depends_on = [ aws_s3_bucket.bucket-1, aws_s3_bucket.bucket-3 ]
# }