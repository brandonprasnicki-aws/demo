variable "tgw_rt_cidrs" {
  type        = list(string)
  default     = []
}
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
variable "routed_transit_gateway_attachment_id" {
  type    = list(string)
  default     = []
}
variable "source_tgw_attachment" {
    type    = list(string)
}