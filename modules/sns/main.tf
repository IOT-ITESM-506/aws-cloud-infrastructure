resource "aws_sns_topic" "my_sns_topic" {
    name = var.sns_topic_name
}