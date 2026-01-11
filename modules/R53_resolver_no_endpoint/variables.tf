variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}

variable "domain" {}
variable "rule_name" {}
variable "rule_type" {}
variable "ad_ips" {
    description = "ips of the AD"
    type        = list(string)
}
variable "vpc_id" {}
variable "endpoint_id" {}


