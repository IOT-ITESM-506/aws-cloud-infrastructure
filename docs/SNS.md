# AWS SNS Terraform Module

## Description

This Terraform module sets up an Amazon Simple Notification Service (SNS) topic. It's intended to be a conduit to pass messages from AWS IoT Core to other AWS services or subscribers.

## Resources Created

- **SNS Topic**: A communication channel to send messages and distribute them to subscribers.

## Usage

To use this module in your Terraform configuration:

```hcl
module "sns" {
  source = "./path_to_module_directory"

  # Provide necessary variables here
}
