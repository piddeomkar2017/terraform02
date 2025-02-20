resource "aws_s3_bucket" "test" {
  bucket = "my-test-bucket-20022025"
  acl = "private"
  force_destroy = true
}

resource "aws_s3_object" "test" {
  bucket = aws_s3_bucket.test.id
  key = "lambda_function.zip"
  source = "lambda_function.zip"
  etag   = filemd5("lambda_function.zip")
}

# Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = "arn:aws:iam::533267309863:role/my-lambda-role"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  s3_bucket        = aws_s3_bucket.test.id 
  s3_key           = aws_s3_object.test.key # inside this folder
  timeout       = 900
  memory_size   = 128

}
