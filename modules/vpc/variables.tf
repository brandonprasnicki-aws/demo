locals {
    has_pub_subnets = length(var.pub_sn_cidrs)
}

variable "region" {
    description = "the AWS region to place resources in"
}

variable "vpc_cidrs" {
  description = "list of cidrs for all subnets in VPC"
  type        = list(string)
  default     = []
}

variable "pub_sn_cidrs" {
  description = "subnets in VPC that will have public access (internet gateway)"
  type        = list(string)
  default     = []
}
variable "allow_public_http" {
  default = true
  description = "enables port 80 for external NACL"
}

variable "allow_public_icmp" {
  default = false
  description = "enables ICMP echo Reply external NACL"
}

variable "allow_public_https" {
  default = true
  description = "enables port 443 for external NACL"
}

variable "pri_sn_az1_cidrs" {
  description = "private subnets in VPC that will host application resources"
  type        = list(string)
  default     = []
}
variable "pri_sn_az2_cidrs" {
  description = "private subnets in VPC that will host application resources"
  type        = list(string)
  default     = []
}
variable "pri_sn_az3_cidrs" {
  description = "private subnets in VPC that will host application resources"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  type        = list(string)
  description = "availability zones used to divide the VPC subnets"
}
variable "natgwy_availability_zones" {
  type        = list(string)
  description = "availability zones to place nat gateways"
}
## variables for Naming
variable "common_tags" {
  description = "tags set in tfvars and then merged with module specific tags"
  type = map(string)

  default = {
    Module = "VPC"
  }
}

variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
}
variable "pri_subnet_purpose" {
  type        = list(string)
  description = "For private subnet naming conventions"
}
variable "pub_subnet_purpose" {
  description = "For public subnet naming conventions"
}
variable "pub2_subnet_purpose" {
  description = "For public subnet naming conventions"
  default = ""
}
variable "flow_log_cloudwatch_log_group_retention_in_days" {}


variable "pri_az1_route_table_id" {
  default = ""
  description = "route table for az1 subnets"
}
variable "pri_az2_route_table_id" {
  default = ""
  description = "route table for az2 subnets"
}
variable "pri_az3_route_table_id" {
  default = ""
  description = "route table for az2 subnets"
}
variable "az1_rt_natgwy_index_tgt" {
  description = "the nat target index for az1 route tables to route"
  default = null
}
variable "az2_rt_natgwy_index_tgt" {
  description = "the nat target index for az2 route tables to route"
  default = null
}
variable "az3_rt_natgwy_index_tgt" {
  description = "the nat target index for az3 route tables to route"
  default = null
}




