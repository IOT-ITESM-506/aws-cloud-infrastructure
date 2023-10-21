provider "aws" {
  region = "us-east-1"
}

module "sns" {
  source         = "./modules/sns"
  sns_topic_name = "iot_notifications_topic"
  sqs_queue_arn  = module.sqs.sqs_queue_arn
}
