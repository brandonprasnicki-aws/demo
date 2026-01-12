# ---- use variables defined in env-vars file
variable "vpc_id" {
  description = "Id of the VPC"
}
variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}

variable "tg_name" {
  description = "name of server"
}
variable "target_ids" {
  type = list(string)
  description = "id of server to target for target group"
}


variable "lb_health_check_path" {
  description = "this is a list of path for health checks for the target groups to be aligned with instance names"
  default     = ""
}
variable "tg_port" {}
variable "tg_protocol" {}
variable "healthy_threshold" {
  default = "3"
}
variable "unhealthy_threshold" {
  default = "2"
}
variable "timeout" {
  default = "5"
}
variable "interval" {
  default = "6"
}
variable "matcher" {
  default = "200"
}
variable "stickiness_type" {
  default = "lb_cookie"
}
variable "stickiness_enabled" {
  default = "false"
}
variable "stickiness_cookie_duration" {
  default = "86400"
}