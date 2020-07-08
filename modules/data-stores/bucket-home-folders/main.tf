terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-south-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_s3_bucket" "bucket" {

  bucket = var.bucket_name
  acl    = "private"

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = false
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "home_folders" {
  count = length(var.folder_names)
  
  # bucket = "${aws_s3_bucket.b.id}"
  bucket = aws_s3_bucket.bucket.id
  key    = element(var.folder_names, count.index)
  source = "/dev/null"
}
