module "sns" {
  source         = "./modules/sns"
  sns_topic_name = "iot_notifications_topic"
  sqs_queue_arn  = module.sqs.sqs_queue_arn
}

module "sqs" {
  source        = "./modules/sqs"
  queue_name    = "iot_notifications_queue"
  sns_topic_arn = module.sns.sns_topic_arn
}
