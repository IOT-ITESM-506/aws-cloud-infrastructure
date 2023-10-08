variable "queue_name" {
    description = "The name of the SQS queue"
    type        = string
    default     = "MySQSQueue"
}

variable "delay_seconds" {
    description = "The time in seconds for which a specific message will be delayed"
    type        = number
    default     = 5
}

variable "message_retention_seconds" {
    description = "The number of seconds to retain a message"
    type        = number
    default     = 345600
}

variable "sns_topic_arn" {
    description = "The ARN of the SNS topic"
    type        = string
}