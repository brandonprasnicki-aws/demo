variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}
variable "listener_arn" {}
variable "cert_arn" {}