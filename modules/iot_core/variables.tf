variable "policy_name" {
  type        = string
  description = "Name for the IoT policy"
}

variable "role_name" {
  type        = string
  description = "Name for the IoT role"
}

variable "rule_name" {
  type        = string
  description = "Name for the IoT topic rule"
}

variable "sql_pattern" {
  type        = string
  description = "SQL pattern for the IoT topic rule"
}

variable "iot_topic_rule_action" {
  type        = string
  description = "ARN of the Lambda function for the IoT topic rule action"
}
