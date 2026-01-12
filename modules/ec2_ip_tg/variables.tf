variable "vpc_id" {
  description = "Id of the VPC"
}
variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
  default     = ""
}

variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}

variable "target_ips" {
  type        = list(string)
}
variable "availability_zone" {
  default = "all"
}


