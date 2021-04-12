resource "aws_lambda_function" "this" {
  function_name                  = var.function_name
  filename                       = "${var.source_dir}/code.zip"
  description                    = var.description
  role                           = var.role
  handler                        = var.handler
  runtime                        = var.runtime
  publish                        = var.publish
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.reserved_concurrent_executions
  timeout                        = var.timeout
  source_code_hash               = filebase64sha256("${var.source_dir}/code.zip")
  layers                         = var.layers

  tracing_config {
    mode = var.tracing_config_mode
  }

  dynamic "environment" {
    for_each = var.environment == null ? [] : [var.environment]
    content {
      variables = var.environment
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

  tags = var.tags
}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${var.source_dir}/code.zip"
}