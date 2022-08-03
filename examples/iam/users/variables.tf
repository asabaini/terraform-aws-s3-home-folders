# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "user_names" {
  description = "The list of user names"
  type    = set(string)
  default = ["myfirstuser", "myseconduser"]
}