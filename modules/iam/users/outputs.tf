output "user_names" {

  value       = values(aws_iam_user.user)[*].name
  description = "The users' name"
}

output "user_access_keys" {
  value       = values(aws_iam_access_key.user_access_key)[*].id
  description = "The users' access keys"
}

output "user_secret_keys" {
  value       = values(aws_iam_access_key.user_access_key)[*].secret
  description = "The users' secret keys"
}