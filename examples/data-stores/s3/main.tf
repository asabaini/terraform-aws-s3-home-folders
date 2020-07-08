terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-south-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "s3" {
  source = "../../../modules/data-stores/s3"
  bucket_name = var.bucket_name
}
