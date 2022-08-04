# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The name to use for the bucket"
  type        = string
  default     = "mytestbucket-home-folder"
}

variable "home_folder_names" {
  description = "The list of home folder names"
  type        = set(string)
  default = ["myfirstfolder", "mysecondfolder"]
}

variable "shared_folder_name" {
  description = "The list of home folder names"
  type        = string
  default = "example_shared_folder"
}

variable "create_personal_folders" {
  description = "If set to true, create personal folders and write permissions"
  type        = bool
  default     = true
}