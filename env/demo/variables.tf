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


variable "on_prem_cidrs" {
  type = list(string)
}
variable "domain_vpc_cidr" {}
variable "prod_vpc_cidr" {}
variable "int-qa_vpc_cidr" {}
variable "dev_vpc_cidr" {}
variable "vpc_cidr" {}
variable "net_egress_vpc_cidr" {}
variable "net_ingress_vpc_cidr" {}
variable "shared_services_vpc_cidr" {}
variable "helium_cidr" {}
variable "shared_services_isolated_vpc_cidr" {}
