provider "aws" {
  region = "eu-central-1"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/src/index.py"
  output_path = "${path.module}/build/hello_world.zip"
}

resource "aws_lambda_function" "hello_world" {
  filename         = "${path.module}/build/hello_world.zip"
  function_name    = "hello_world"
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.12"
  handler          = "index.lambda_handler"
}

resource "null_resource" "sam_metadata_aws_lambda_function_hello_world" {
  triggers = {
    resource_name        = "aws_lambda_function.hello_world"
    resource_type        = "ZIP_LAMBDA_FUNCTION"
    original_source_code = "${path.module}/src"
    built_output_path    = "${path.module}/build/hello_world.zip"
  }
}
