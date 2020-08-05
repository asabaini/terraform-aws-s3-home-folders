terraform {
  required_version = ">= 0.12, < 0.13"
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

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
}

resource "aws_s3_bucket_object" "home_folders" {
  count = var.create_personal_folders? length(var.home_folder_names) : 0
  
  bucket = aws_s3_bucket.bucket.id
  key    = format("%s/", element(var.home_folder_names, count.index))
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "shared_folder" {
  bucket = aws_s3_bucket.bucket.id
  key    = format("%s/", var.shared_folder_name)
  source = "/dev/null"
}
