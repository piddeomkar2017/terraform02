

# Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = "arn:aws:iam::533267309863:role/my-lambda-role"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 900
  memory_size   = 128

  filename         = "lambda_function.zip"  # Ensure this file exists
  source_code_hash = filebase64sha256("lambda_function.zip")
}
