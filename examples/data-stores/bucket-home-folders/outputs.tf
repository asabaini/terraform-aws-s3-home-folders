output "s3_bucket_arn" {
  value       = module.bucket-home-folders.s3_bucket_arn
  description = "The ARN of the S3 bucket"
}