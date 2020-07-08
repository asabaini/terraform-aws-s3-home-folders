# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "user_names" {
  description = "The list of user names"
  type    = list(string)
  default = ["myfirstuser", "myseconduser"]
}