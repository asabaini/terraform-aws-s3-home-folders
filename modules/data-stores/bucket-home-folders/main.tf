data "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "home_folders" {
  for_each = var.home_folder_names
  
  bucket = data.aws_s3_bucket.bucket.id
  key    = format("%s/", each.value)
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "shared_folder" {
  bucket = data.aws_s3_bucket.bucket.id
  key    = format("%s/", var.shared_folder_name)
  source = "/dev/null"
}
