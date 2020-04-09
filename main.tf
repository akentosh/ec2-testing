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
    Name       = "akentosh-demo"
    CostCenter = "akentosh"
    ttl        = "8h"
    owner      = "Adam Kentosh"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "akentosh-test-bucket"
  acl    = "private"
  tags = {
    Name        = "akentosh-test"
    Environment = "Dev"
    ttl    = "8h"
    owner  = "Adam Kentosh"
  }
}

