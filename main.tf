module "sns" {
    source = "./modules/sns"
}

module "sqs" {
    source         = "./modules/sqs"
    sns_topic_arn  = module.sns.sns_topic_arn
    queue_name     = "iot_aws_queue" 
    delay_seconds  = 5                   
    message_retention_seconds = 345600 
}

module "lambda_function" {
    source        = "./modules/lambda_function"
    function_name = "record_iot_data_lambda"
    filename      = "lambda_src/lambda_function.zip"
    iam_role_arn  = "arn:aws:iam::711704289087:role/IoT-AWS-Lambda"
    sqs_queue_arn = module.sqs.sqs_queue_arn
    log_group_name = module.cloudwatch_logs.log_group_name
}

module "cloudwatch_logs" {
  source               = "./modules/cloudwatch_logs"
  lambda_function_name = "record_iot_data_lambda"
  retention_in_days    = 7
}