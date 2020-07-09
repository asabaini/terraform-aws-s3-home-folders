terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "bucket-home-folders" {
  source       = "module/data-stores/bucket-home-folders"
  bucket_name  = var.bucket_name
  folder_names = var.user_names
}

module "users" {
  source     = "modules/iam/users"
  user_names = var.user_names
  path       = var.path
}

resource "aws_iam_group" "group" {
  name = var.group_name
  path = var.path
}

resource "aws_iam_group_membership" "team" {
  name = var.team_name

  users = var.user_names

  group = aws_iam_group.group.name
}

