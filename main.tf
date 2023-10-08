module "sns" {
    source = "./modules/sns"
}

module "iot_core" {
    source       = "./modules/iot-core"
    sns_topic_arn = module.sns.sns_topic_arn
}