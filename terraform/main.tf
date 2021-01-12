provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "paul_lambda_policy_test"
  path        = "/"
  description = "My test policy"

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
            "Resource": "*"
          }
        ]
      }
EOF
}

resource "aws_iam_role" "lambda_role" {
  name = "paul_lambda_role_test"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "lambda" {
  filename      = "../lambda-function.zip"
  function_name = "paul-simple-test-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "simple-lambda.lambda_handler"

  source_code_hash = filebase64sha256("../lambda-function.zip")

  runtime = "python3.8"

}