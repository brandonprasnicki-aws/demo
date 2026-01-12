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

#variable "alb_target_id" {
#  description = "id of alb"
#}

variable "subnets_ids" {
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

variable "internal" {
  type        = bool
  default     = false
}
variable "lb_name" {}
variable "nlb_alb_protocol" {}
variable "nlb_alb_listener_port" {}
variable "protocol" {
  default = "TCP"
}
variable "target_group_arn" {}
variable "enable_deletion_protection" {
  type        = bool
  default = true
}
variable "region" {
  type = string
}
variable "aws_profile" {
  type = string
}
