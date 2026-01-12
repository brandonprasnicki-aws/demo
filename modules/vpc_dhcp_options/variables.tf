## variables for Naming
variable "common_tags" {
  description = "tags set in tfvars and then merged with module specific tags"
  type = map(string)

  default = {
    Module = "VPC_DHCP_Options"
  }
}

variable "vpc_id" {
  description = "targeted vpc"
}
variable "dns_ip_addresses" {
  type        = list(string)
  description = "dns dc ips"
}
variable "domain_name" {
  default = ""
}





