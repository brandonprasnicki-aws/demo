variable "tgw_attachment_subnets" {}
variable "vpc_id" {}
variable "tgw_id" {}

variable "common_tags" {
  type = map(string)

  default = {
  }
}

variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
  default     = ""
}
variable "appliance_mode_support" {
  default = "disable"
}
variable "transit_gateway_default_route_table_association" {
  default = false
}
variable "transit_gateway_default_route_table_propagation" {
  default = false
}