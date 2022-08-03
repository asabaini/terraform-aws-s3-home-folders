output "user_names" {
  value       = module.users.user_names
  description = "The users' name"
}

output "user_access_keys" {
  value       = module.users.user_access_keys
  description = "The users' access keys"
}

output "user_secret_keys" {
  value       = module.users.user_secret_keys
  description = "The users' secret keys"
  sensitive   = true
}
