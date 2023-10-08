resource "aws_iot_thing" "my_esp8266" {
    name = var.iot_thing_name
}

resource "aws_iot_certificate" "my_esp8266_cert" {
    active = true
}

resource "aws_iot_topic_rule" "sns_rule" {
    name        = "MySNSTopicRule"
    description = "Sends data to SNS topic"
    enabled     = true

    sql           = "SELECT * FROM 'some/topic/filter'"
    sql_version   = "2016-03-23"

    sns {
        target_arn = var.sns_topic_arn
        role_arn   = aws_iam_role.iot_sns_role.arn
    }
}

resource "aws_iot_policy" "my_esp8266_policy" {
    name = var.iot_policy_name

    policy = jsonencode({
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Action" : [
                    "iot:Connect",
                    "iot:Publish",
                    "iot:Subscribe",
                    "iot:Receive"
                ],
                "Resource" : "*"
            }
        ]
    })
}

resource "aws_iot_policy_attachment" "esp8266_policy_attach" {
    policy = aws_iot_policy.my_esp8266_policy.name
    target = aws_iot_certificate.my_esp8266_cert.arn
}

resource "aws_iam_role" "iot_sns_role" {
    name = "IOT_SNS_Role_v2"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Action = "sts:AssumeRole",
                Principal = {
                    Service = "iot.amazonaws.com"
                },
                Effect = "Allow"
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "iot_sns_attach" {
    role       = aws_iam_role.iot_sns_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSIoTRuleActions"
}