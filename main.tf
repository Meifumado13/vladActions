# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = "eu-west-1"
}

#4

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"
  cloud {

    organization = "vladActions"

    workspaces {
      name = "gityoassingear"
    }
  }
}


data "aws_ami" "amazon-linux-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.160.0.0/16"

  tags = {
    Name = "Test-VPC"
  }
}