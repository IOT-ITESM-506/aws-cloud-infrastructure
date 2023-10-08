resource "aws_lambda_function" "my_lambda" {
    function_name = var.function_name
    handler       = var.handler
    runtime       = var.runtime
    filename      = var.filename
    role          = var.iam_role_arn
}

resource "aws_lambda_event_source_mapping" "sqs_mapping" {
    event_source_arn = var.sqs_queue_arn
    function_name    = aws_lambda_function.my_lambda.arn
}
