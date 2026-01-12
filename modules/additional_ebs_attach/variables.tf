variable "additional_volume_size" {
    description = "volume size of attached disk"
}

variable "aws_instance_id" {
    description = "instance for additional attached disk"
}

variable "availability_zone" {
  description = "availability zone for ebs volume"
}
variable "tag_prefix" {
  description = "tag_prefix for naming conventions"
  default     = ""
}

variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}

variable "device_name" {
  default = "xvdb"
}