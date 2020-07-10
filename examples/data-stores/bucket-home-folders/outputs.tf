output "bucket_domain_name" {
  value       = module.bucket-home-folders.bucket_domain_name
  description = "The bucket domain name in the form bucketname.s3.amazonaws.com"
}