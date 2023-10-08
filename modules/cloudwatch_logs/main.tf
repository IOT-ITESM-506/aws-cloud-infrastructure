resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.retention_in_days
}

output "log_group_name" {
  description = "The name of the log group"
  value       = aws_cloudwatch_log_group.lambda_log_group.name
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain log events"
  type        = number
  default     = 14
}

resource "aws_iam_role_policy" "lambda_logging" {
  name = "LambdaLogging"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role" "lambda_role" {
  name = "MyLambdaExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
