# ---- use variables defined in env-vars file
variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
  default     = ""
}

variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}

