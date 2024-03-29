# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The name to use for the bucket"
  type        = string
}

variable "home_folder_names" {
  description = "The list of home folder names"
  type        = set(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "shared_folder_name" {
  description = "The name of the shared folder"
  type        = string
  default     = "shared_folder"
}

variable "create_personal_folders" {
  description = "If set to true, create personal folders"
  type        = bool
  default     = true
}