variable "function_name" {
  description = "The name of the function"
  type        = string
}

variable "filename" {
  description = "The filename of the function"
  type        = string
}

variable "description" {
  description = "(Optional) The description of the function"
  type        = string
  default     = null
}

variable "role" {
  description = "The arn role"
  type        = string
  default     = null
}

variable "handler" {
  description = "The handler of the function"
  type        = string
}

variable "runtime" {
  description = "The runtime of the function"
  type        = string
}

variable "publish" {
  description = "The publish of the function"
  type        = bool
  default     = false
}

variable "memory_size" {
  description = "The memory size of the function"
  type        = string
  default     = "128"
}

variable "reserved_concurrent_executions" {
  description = "The reserved concurrent executions"
  type        = string
  default     = null
}

variable "timeout" {
  description = "The timeout of the function"
  type        = number
  default     = 3
}

variable "layers" {
  description = "The layers of the function"
  type        = list(string)
  default     = []
}

variable "tracing_config_mode" {
  description = "The tracing config mode"
  type        = string
  default     = "PassThrough"
}

variable "environment" {
  description = "The Lambda environment's configuration settings."
  type        = map(string)
  default     = null
}

variable "vpc_config" {
  description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  default = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the function."
  type        = map(string)
  default     = {}
}