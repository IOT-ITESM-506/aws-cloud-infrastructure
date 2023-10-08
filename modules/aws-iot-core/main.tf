provider "aws" {
  region = var.aws_region
}

resource "aws_iot_thing" "my_esp8266" {
  name = "myESP8266Thing"
}

resource "aws_iot_certificate" "my_esp8266_cert" {
  active = true
}

resource "aws_iot_policy" "my_esp8266_policy" {
  name = "MyESP8266PolicyV2"

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
