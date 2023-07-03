# Define the Lambda function
resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  role          = aws_iam_role.my_lambda_role.arn
  handler       = "index.handler"
  runtime       = "python3.8"
  timeout       = 10
  memory_size   = 128

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}

# Define the IAM role for Lambda
resource "aws_iam_role" "my_lambda_role" {
  name               = "my-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Define the IAM role policy for Lambda
resource "aws_iam_role_policy" "my_lambda_role_policy" {
  name   = "my-lambda-role-policy"
  role   = aws_iam_role.my_lambda_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}
