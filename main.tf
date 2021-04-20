resource "aws_lambda_function" "this" {
  function_name                  = var.function_name
  filename                       = var.filename
  s3_bucket                      = var.s3_bucket
  s3_key                         = var.s3_key
  description                    = var.description
  role                           = var.role
  handler                        = var.handler
  runtime                        = var.runtime
  publish                        = var.publish
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.reserved_concurrent_executions
  timeout                        = var.timeout
  source_code_hash               = filebase64sha256(var.filename)
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