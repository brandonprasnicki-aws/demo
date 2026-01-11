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
variable "ami" {
    description = "ami of server"
}
variable "instance_type" {
    description = "instance type of server"
}
variable "security_groups" {
    description = "list of security groups for server"
    type        = list(string)
}

variable "volume_size" {
    description = "volume size of attached disk"
}

variable "target_subnets_id" {
  description = "subnets in VPC for servers"
  default     = []
}
variable "key_name" {
  description = "the ssh key for the instance to use"
}

variable "availability_zone" {
  description = "availability zones used to divide the VPC subnets"
}
variable "aws_iam_instance_profile_id" {
  default = ""
}
variable "associate_public_ip_address" {
  type = bool
  default = false
}
/*
variable "patch_scan_tag_name" {
  default = "Scan Group"
}
variable "patch_scan_tag_value" {
  default = "TOSCAN"
}
variable "patch_tag_name" {
  default = "Patch Group"
}
variable "patch_tag_value" {
  default = "TOPATCH"
}

 */
variable "private_ip" {
  default = null
}
variable "http_tokens" {
  default = "required"
}