variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}
variable "listener_arn" {}
variable "priority" {
  default = null
}
variable "target_group_arn" {}
variable "host_header" {}
