# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket_name" {
  description = "The name to use for the bucket"
  type        = string
  default     = "mytestbucket-home-folder"
}

variable "folder_names" {
  description = "The list of folder names"
  type        = list(string)
  default = ["myfirstfolder/", "mysecondfolder/"]
}