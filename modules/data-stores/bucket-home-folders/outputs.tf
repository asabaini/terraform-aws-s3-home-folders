output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name 
  description = "The bucket domain name in the form bucketname.s3.amazonaws.com"
}
