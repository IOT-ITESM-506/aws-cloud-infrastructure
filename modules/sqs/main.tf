provider "aws" {
  region = var.aws_region
}

resource "aws_sns_topic" "my_topic" {
  name = var.sns_topic_name
}

resource "aws_sqs_queue" "my_queue" {
  name = var.sqs_queue_name
}

resource "aws_sns_topic_subscription" "my_sqs_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.my_queue.arn
}
