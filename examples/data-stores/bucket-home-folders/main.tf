terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-south-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

module "bucket-home-folders" {
  source                  = "../../../modules/data-stores/bucket-home-folders"
  bucket_name             = aws_s3_bucket.bucket.id
  home_folder_names       = var.home_folder_names
  shared_folder_name      = var.shared_folder_name
  create_personal_folders = var.create_personal_folders
}
