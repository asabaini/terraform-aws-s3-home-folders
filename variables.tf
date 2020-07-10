# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The bucket name - must be globally unique"
  type        = string
}

variable "user_names" {
  description = "The list of user names"
  type        = list(string)
}

variable "group_name" {
  description = "The group name"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "path" {
  description = "The path for the users to be created in"
  type        = string
  default     = "/users/"
}

variable "shared_folder_name" {
  description = "The shared folder name"
  type        = string
  default     = "sharedfolder"
}