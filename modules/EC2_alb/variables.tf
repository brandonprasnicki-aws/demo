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
variable "subnets_ids" {
  description = "subnets in VPC for load balancers"
  type        = list(string)
  default     = []
}
variable "enable_http" {
  description = "used to check on certain rules to allow port 80 on security groups, will skip this"
  type = bool
  default = false
}
variable "enable_https" {
  description = "used to check on certain rules to allow port 443 on security groups, will skip this"
  type = bool
  default = true
}
/*
variable "web_cidrs" {
  type        = list(string)
  description = "Allowed IPs for ASG Web LB"
}

 */
variable "internal" {
  type        = bool
  default     = false
}
variable "lb_name" {}
variable "LB_cert_arn" {}
variable "access_logs" {
  default = true
}
variable "access_logs_bucket" {
    type        = list(string)
}
variable "access_logs_bucket_prefix" {}
variable "alb_description" {}
variable "ssl_policy" {
  default = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}
variable "enable_deletion_protection" {
  type        = bool
  default = true
}
variable "drop_invalid_header_fields" {
  type = bool
  default = true
}
variable "alb_sg_id" {}


