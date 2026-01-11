variable "aws_profile" {
}

variable "region" {
}

variable "common_tags" {
  type = map(string)

  default = {
    Module = ""
  }
}

variable "availability_zones" {
  description = "list of AZs to use for subnet creation etc"
  type        = list(string)
  default     = []
}

variable "vpc_cidr" {}
