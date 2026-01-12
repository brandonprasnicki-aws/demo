variable "security_groups" {
    description = "list of security groups for endpoint"
    type        = list(string)
}

variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}
variable "direction" {
  description = "direction for endpoint"
  default = "OUTBOUND"
}
variable "subnets" {
    description = "list of subnets for endpoint"
    type        = list(string)
}
variable "endpoint_name" {}

variable "domain" {}
variable "rule_name" {}
variable "rule_type" {}
variable "ad_ips" {
    description = "ips of the AD"
    type        = list(string)
}
variable "vpc_id" {}


