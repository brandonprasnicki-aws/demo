variable "mgn_subnets" {
  description = "private subnets for MGN"
  type        = list(string)
  default     = []
}
variable "vpc_id" {}
variable "region" {
    description = "the AWS region to place resources in"
}

variable "common_tags" {
  description = "tags set in tfvars and then merged with module specific tags"
  type = map(string)

}
variable "security_group_id" {
  description = "sg for mgn endpoint"
}
variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
}