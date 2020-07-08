output "user_arns" {
  value       = aws_iam_user.user.*.arn
  description = "Users ARNs"
}

output "user_access_keys" {
  value       = aws_iam_access_key.user_access_key.*.id
  description = "The users' keys"
}

output "user_secret_keys" {
  value       = aws_iam_access_key.user_access_key.*.secret
  description = "The users' keys"
}