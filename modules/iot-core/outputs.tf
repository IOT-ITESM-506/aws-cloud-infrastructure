output "iot_thing_name" {
    value = aws_iot_thing.my_esp8266.name
}

output "iot_policy_name" {
    value = aws_iot_policy.my_esp8266_policy.name
}

output "iot_certificate_arn" {
    value = aws_iot_certificate.my_esp8266_cert.arn
}
