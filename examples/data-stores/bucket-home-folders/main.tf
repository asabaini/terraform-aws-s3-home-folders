terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

module "bucket-home-folders" {
  source = "../../../modules/data-stores/bucket-home-folders"
  bucket_name = aws_s3_bucket.bucket.id
  home_folder_names = var.home_folder_names
  shared_folder_name = var.shared_folder_name
}
