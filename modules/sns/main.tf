provider "aws" {
  region = var.aws_region
}

resource "aws_sns_topic" "my_topic" {
  name = var.sns_topic_name
}