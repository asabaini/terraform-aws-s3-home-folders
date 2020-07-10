output "users_arns" {
  value       = module.users.*.user_arns
  description = "The ARN of the users"
}

output "user_names" {
  value       = aws_iam_user.user.*.name
  description = "The users' name"
}

output "user_access_keys" {
  value       = aws_iam_access_key.user_access_key.*.id
  description = "The users' access keys"
}

output "user_secret_keys" {
  value       = aws_iam_access_key.user_access_key.*.secret
  description = "The users' secret keys"
}