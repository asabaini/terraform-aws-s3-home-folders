terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-south-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_iam_user" "user" {
  count = length(var.user_names)
  
  name = element(var.user_names, count.index)
  path = var.path
}

resource "aws_iam_access_key" "user_access_key" {
  count = length(var.user_names)
  
  user = aws_iam_user.user[count.index].name
}
