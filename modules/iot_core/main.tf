provider "aws" {
  # Configuraciones del proveedor AWS
  region = "us-east-1"  # Ajusta según tu región
}

resource "aws_iot_policy" "iot_policy" {
  name        = var.policy_name
  description = "IoT Thing Policy"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "iot:*",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role" "iot_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "iot.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_iot_role_alias" "iot_role_alias" {
  alias                = "iot_role_alias"
  role_arn             = aws_iam_role.iot_role.arn
  role_alias           = var.role_name
}

resource "aws_iot_topic_rule" "iot_topic_rule" {
  name        = var.rule_name
  description = "IoT Topic Rule"
  sql         = var.sql_pattern
  enabled     = true
  sql_version = "2016-03-23"

  actions {
    sns {
      target_arn = aws_sns_topic.my_sns_topic.arn
      role_arn   = aws_iam_role.iot_role.arn
    }
  }
}