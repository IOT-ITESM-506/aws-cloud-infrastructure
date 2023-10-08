module "sns" {
    source = "./modules/sns"
}

module "iot_core" {
    source       = "./modules/iot-core"
    sns_topic_arn = module.sns.sns_topic_arn
}

module "sqs" {
    source         = "./modules/sqs"
    sns_topic_arn  = module.sns.sns_topic_arn
    queue_name     = "IoT_AWS_Queue" # Optional
    delay_seconds  = 5                   # Optional
    message_retention_seconds = 345600   # Optional
}