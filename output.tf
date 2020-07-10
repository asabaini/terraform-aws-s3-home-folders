output "user_names" {
  value       = module.users.*.user_names
  description = "The users' name"
}

output "user_access_keys" {
  value       = module.users.*.user_access_keys
  description = "The users' keys"
}

output "user_secret_keys" {
  value       = module.users.*.user_secret_keys
  description = "The users' keys"
}

output "bucket_domain_name" {
  value = module.bucket-home-folders.bucket_domain_name
  description = "The bucket domain name in the form bucketname.s3.amazonaws.com"
}
