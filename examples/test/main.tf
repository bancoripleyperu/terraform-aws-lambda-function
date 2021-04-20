module "this" {
  source = "../../"

  function_name = random_string.this.result
  filename      = "./code/code.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python2.7"
  role          = module.iam-role.values.arn

  tags = {
    Project = "titan"
  }

  depends_on = [
    data.archive_file.this
  ]
}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "./code/"
  output_path = "./code/code.zip"
}

resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
}

module "iam-role" {
  source  = "bancoripleyperu/iam-role/aws"
  version = "0.0.4"

  name         = random_string.this.result
  aws_services = ["lambda.amazonaws.com"]

  tags = {
    Project = "titan"
  }
}