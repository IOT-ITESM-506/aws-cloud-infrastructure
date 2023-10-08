output "iot_certificate_arn" {
  description = "The ARN of the IoT Certificate."
  value       = aws_iot_certificate.my_esp8266_cert.arn
}

output "iot_thing_name" {
  description = "The name of the IoT Thing."
  value       = aws_iot_thing.my_esp8266.name
}
