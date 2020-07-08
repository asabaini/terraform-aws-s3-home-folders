terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-south-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "bucket-home-folders" {
  source = "../../../modules/data-stores/bucket-home-folders"
  bucket_name = var.bucket_name
  folder_names = var.folder_names
}
