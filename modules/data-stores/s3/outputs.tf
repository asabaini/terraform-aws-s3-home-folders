output "s3_bucket_arn" {
  value       = aws_s3_bucket.home_folder.arn
  description = "The ARN of the S3 bucket"
}

