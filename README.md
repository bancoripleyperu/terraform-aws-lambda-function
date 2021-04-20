## Usage

```hcl
module "this" {
  source  = "bancoripleyperu/lambda-function/aws"
  version = "0.0.1"

  function_name = "myFunction"
  source_dir    = "./code/"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python2.7"
  role          = module.iam-role.values.arn
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.19 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.19 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional) The description of the function | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The Lambda environment's configuration settings. | `map(string)` | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | The filename of the function | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The name of the function | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | The handler of the function | `string` | n/a | yes |
| <a name="input_layers"></a> [layers](#input\_layers) | The layers of the function | `list(string)` | `[]` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The memory size of the function | `string` | `"128"` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | The publish of the function | `bool` | `false` | no |
| <a name="input_reserved_concurrent_executions"></a> [reserved\_concurrent\_executions](#input\_reserved\_concurrent\_executions) | The reserved concurrent executions | `string` | `null` | no |
| <a name="input_role"></a> [role](#input\_role) | The arn role | `string` | `null` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The runtime of the function | `string` | n/a | yes |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The s3 bucket of the package | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | The s3 key of the package | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the function. | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The timeout of the function | `number` | `3` | no |
| <a name="input_tracing_config_mode"></a> [tracing\_config\_mode](#input\_tracing\_config\_mode) | The tracing config mode | `string` | `"PassThrough"` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC. | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_values"></a> [values](#output\_values) | All outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Test

```sh
gem install bundler
bundle install --jobs 4 --retry 3
bundle exec kitchen test
```

## Doc

```sh
pre-commit run -a
```

## Autor
 
Module managed by [Banco Ripley Peru](https://ripley.com.pe)