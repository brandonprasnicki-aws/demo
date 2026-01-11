# ---- use variables defined in env-vars file
variable "vpc_id" {
  description = "Id of the VPC"
}

variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}
variable "zone_name" {
  description = "name of r53 zone"
}

variable "record" {
  type = map(object({
    name                = string
    record_name         = string
    #record_target_name  = string
    #record_target_zone  = string
    type                = string
    ttl                 = string
  }))
}
#variable "alb_target_id" {
#  description = "id of alb"
#}


