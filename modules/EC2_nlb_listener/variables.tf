variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}


variable "port" {}
variable "protocol" {}
variable "nlb_arn" {}
variable "target_group_arn" {}
