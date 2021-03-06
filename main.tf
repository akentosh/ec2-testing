provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"

  tags = {
    ttl         = "8h"
    owner       = "Adam Kentosh"
    Environment = var.environment
    demo        = "ac"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "akentosh-test-bucket"
  acl    = "private"
  tags = {
    CostCenter  = "AdamK"
    Name        = "app1-${var.environment}"
    Environment = var.environment
    ttl         = "8h"
    owner       = "Adam Kentosh"
    demo        = "WWT"
  }
}

resource "aws_sns_topic" "order_udpates" {
  name = "order-updates-${var.environment}"
}

resource "aws_sns_topic" "delivery_updates" {
  name = "delivery-updates-${var.environment}"
}
