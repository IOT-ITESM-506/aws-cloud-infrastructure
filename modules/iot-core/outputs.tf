output "iot_thing_arn" {
    description = "ARN of the IoT Thing"
    value       = aws_iot_thing.my_esp8266.arn
}

output "iot_certificate_arn" {
    description = "ARN of the IoT Certificate"
    value       = aws_iot_certificate.my_esp8266_cert.arn
}
