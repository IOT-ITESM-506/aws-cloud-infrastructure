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

module "lambda" {
  source                    = "./modules/lambda"
  lambda_function_name      = "iot_notifications_lambda"
  lambda_handler            = "app.handler"
  lambda_runtime            = "python3.8"
  lambda_timeout            = 10
  lambda_memory_size        = 128
  lambda_execution_role_name = "my_lambda_execution_role"
  lambda_zip_file           = "./lambda_src/lambda_function.zip" 
  sqs_queue_arn = module.sqs.sqs_queue_arn
}