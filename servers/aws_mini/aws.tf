variable "region" {
  type = string
  description = "Default AWS region"
}

terraform {
  backend "s3" {
    bucket = "geerydev-ec2"
    key    = "~/.aws/credentials"
    region = "us-west-2"
  }
}

provider "aws" {
    region = var.region
}
