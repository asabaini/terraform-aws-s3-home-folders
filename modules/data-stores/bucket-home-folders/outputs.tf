output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name 
  description = "The domain name of the S3 bucket"
}

