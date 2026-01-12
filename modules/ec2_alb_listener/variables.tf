variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}


variable "port" {}
variable "protocol" {}
variable "alb_arn" {}
variable "target_group_arn" {}
variable "LB_cert_arn" {}
variable "ssl_policy" {
  default = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}