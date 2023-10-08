# IoT Core Terraform Module

## Description

This Terraform module provisions the necessary AWS resources to set up a thing in AWS IoT Core. It's intended to be used as part of an infrastructure that receives messages from a NodeMCU ESP8266 device.

## Resources Created

- **IoT Thing**: Represents the NodeMCU ESP8266 device.
- **IoT Certificate**: A certificate to secure the connection between your device and AWS IoT Core.
- **IoT Policy**: Defines what actions can be performed (e.g., publish, subscribe).
- **IoT Topic Rule**: Defines the action to take (e.g., send a message to an SNS topic) when a message is received on a particular MQTT topic.

## Usage

To use this module in your Terraform configuration:

```hcl
module "iot_core" {
  source = "./path_to_module_directory"

  # Provide necessary variables here
}
