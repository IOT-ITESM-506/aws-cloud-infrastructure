resource "aws_sqs_queue" "my_sqs_queue" {
    name = var.queue_name
    delay_seconds = var.delay_seconds
    message_retention_seconds = var.message_retention_seconds
}

resource "aws_sns_topic_subscription" "sns_sqs_subscription" {
    topic_arn = var.sns_topic_arn
    protocol  = "sqs"
    endpoint  = aws_sqs_queue.my_sqs_queue.arn
}