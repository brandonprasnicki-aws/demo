variable "security_group_id" {}

variable "allowed_ingress_cidrs" {
    type    = list(string)
}

variable "from_port" {}
variable "to_port" {}
variable "protocol" {}

