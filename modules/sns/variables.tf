variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "us-east-1"
}

variable "sns_topic_name" {
  description = "Name for the SNS topic"
  default     = "MyIoTTopic"
}