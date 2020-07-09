# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The name to use for the bucket"
  type        = string
}

variable "folder_names" {
  description = "The list of folder names"
  type        = list(string)
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
