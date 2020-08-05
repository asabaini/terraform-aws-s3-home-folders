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
  type        = list(string)
  default = ["myfirstfolder", "mysecondfolder"]
}

variable "shared_folder_name" {
  description = "The list of home folder names"
  type        = string
  default = "example_shared_folder"
}