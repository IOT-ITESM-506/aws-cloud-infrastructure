variable "iot_thing_name" {
    description = "Name of the IoT Thing"
    type        = string
    default     = "myESP8266Thing"
}

variable "iot_policy_name" {
    description = "Name of the IoT policy"
    type        = string
    default     = "MyESP8266Policy"
}

variable "sns_topic_arn" {
    description = "The ARN of the SNS topic to which IoT Core will send messages."
    type        = string
}
