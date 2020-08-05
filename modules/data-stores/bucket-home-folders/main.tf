terraform {
  required_version = ">= 0.12, < 0.13"
}

data "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "home_folders" {
  count = var.create_personal_folders? length(var.home_folder_names) : 0
  
  bucket = data.aws_s3_bucket.bucket.id
  key    = format("%s/", element(var.home_folder_names, count.index))
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "shared_folder" {
  bucket = data.aws_s3_bucket.bucket.id
  key    = format("%s/", var.shared_folder_name)
  source = "/dev/null"
}
