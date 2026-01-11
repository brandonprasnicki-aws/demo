# ---- use variables defined in env-vars file
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



variable "instance_name" {
  description = "name of server"
}
variable "target_id" {
  description = "id of server to target for target group"
}
variable "alb_target_id" {
  description = "id of alb"
}
variable "nlb_num" {
  description = "count of nlb"
}
variable "LB_cert_arn" {
    default = ""
    description = "the arn of the cert in acm to use for the LB"
}

variable "web_subnets_ids" {
  description = "subnets in VPC for load balancers"
  type        = list(string)
  default     = []
}
#variable "lb_health_check_path" {
#  description = "this is a list of path for health checks for the target groups to be aligned with instance names"
#  default     = []
#}
variable "enable_cross_zone_load_balancing" {
  default = true
}