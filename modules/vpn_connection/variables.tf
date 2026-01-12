variable "tgw_id" {
  description = "Id of the VPG attached to the VPC"
}

variable "target_name" {
  description = "Name of the target datacenter "
}

variable "use_static_route" {
  description = "Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP"
  default = true
}

variable "target_vpn_endpoint_ip" {
  description = "Public IP for the target datacenter VPN"
}

variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
  default     = ""
}

variable "common_tags" {
  type = map(string)
}


variable "tunnel1_preshared_key" {
  default = ""
}
variable "tunnel2_preshared_key" {
  default = ""
}
variable "bgp_asn" {}
variable "device_name" {}