variable "function_name" {
    description = "Name of the lambda function."
    type        = string
}

variable "handler" {
    description = "The function entrypoint in your code."
    type        = string
    default     = "lambda_function.lambda_handler" # default handler name for Python
}

variable "runtime" {
    description = "Lambda function runtime."
    type        = string
    default     = "python3.8"
}

variable "filename" {
    description = "The path to the function's deployment package."
    type        = string
}

variable "iam_role_arn" {
    description = "The ARN of the IAM role that Lambda assumes."
    type        = string
}

variable "sqs_queue_arn" {
    description = "The ARN of the SQS queue."
    type        = string
}
